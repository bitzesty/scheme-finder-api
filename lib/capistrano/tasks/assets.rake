# This is backport of https://github.com/capistrano/rails/commit/5b5b22ce666c80b5ee005681d80dbbf2676afdd1
# in order to make assets_prefix work for asset compilation on deploy
# which is necessary for this app
#
# Remove this once upgraded to capistrano-rails >= 1.1.1

module Capistrano
  class FileNotFound < StandardError
  end
end

namespace :deploy do
  before :starting, :set_shared_assets do
    set :assets_prefix, 'backend/assets'
    set :linked_dirs, (fetch(:linked_dirs) || []).push("public/#{fetch(:assets_prefix)}")
  end

  task :set_rails_env do
    set :rails_env, (fetch(:rails_env) || fetch(:stage))
  end

  desc 'Normalise asset timestamps'
  task :normalise_assets => [:set_rails_env] do
    on roles :web do
      assets = fetch(:normalize_asset_timestamps)
      if assets
        within release_path do
          execute :find, "#{assets} -exec touch -t #{asset_timestamp} {} ';'; true"
        end
      end
    end
  end

  desc 'Compile assets'
  task :compile_assets => [:set_rails_env] do
    invoke 'deploy:assets:precompile'
    invoke 'deploy:assets:backup_manifest'
  end

  # FIXME: it removes every asset it has just compiled
  desc 'Cleanup expired assets'
  task :cleanup_assets => [:set_rails_env] do
    on roles :web do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "assets:clean"
        end
      end
    end
  end

  desc 'Rollback assets'
  task :rollback_assets => [:set_rails_env] do
    begin
      invoke 'deploy:assets:restore_manifest'
    rescue Capistrano::FileNotFound
      invoke 'deploy:compile_assets'
    end
  end

  after 'deploy:updated', 'deploy:compile_assets'
  # NOTE: we don't want to remove assets we've just compiled
  # after 'deploy:updated', 'deploy:cleanup_assets'
  after 'deploy:updated', 'deploy:normalise_assets'
  after 'deploy:reverted', 'deploy:rollback_assets'

  namespace :assets do
    task :precompile do
      on roles :web do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "assets:precompile"
          end
        end
      end
    end

    task :backup_manifest do
      on roles :web do
        within release_path do
          execute :cp,
            release_path.join('public', fetch(:assets_prefix), 'manifest*'),
            release_path.join('assets_manifest_backup')
        end
      end
    end

    task :restore_manifest do
      on roles :web do
        within release_path do
          source = release_path.join('assets_manifest_backup')
          target = capture(:ls, release_path.join('public', fetch(:assets_prefix),
                                                  'manifest*')).strip
          if test "[[ -f #{source} && -f #{target} ]]"
            execute :cp, source, target
          else
            msg = 'Rails assets manifest file (or backup file) not found.'
            warn msg
            fail Capistrano::FileNotFound, msg
          end
        end
      end
    end
  end
end

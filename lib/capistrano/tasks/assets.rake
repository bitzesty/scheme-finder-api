# This is backport of https://github.com/capistrano/rails/commit/5b5b22ce666c80b5ee005681d80dbbf2676afdd1
# in order to make assets_prefix work for asset compilation on deploy
# which is necessary for this app
#
# Remove this once upgraded to capistrano-rails >= 1.1.1
namespace :deploy do
  namespace :assets do
    task :backup_manifest do
      on roles(fetch(:assets_roles)) do
        within release_path do
          execute :cp,
            release_path.join('public', fetch(:assets_prefix), 'manifest*'),
            release_path.join('assets_manifest_backup')
        end
      end
    end

    task :restore_manifest do
      on roles(fetch(:assets_roles)) do
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

SSHKit.config.command_map[:rake] = "bundle exec rake"

set :application, "scheme-finder-api"
set :repo_url, "git@github.com:bitzesty/#{fetch(:application)}.git"
set :user, "schemer"

set :hipchat_token, ENV["HIPCHAT_TOKEN"]
set :hipchat_room_name, "BIS"
set :hipchat_announce, false
set :hipchat_color, "yellow"
set :hipchat_success_color, "green"
set :hipchat_failed_color, "red"

# asset precompilation options
set :assets_prefix, 'backend/assets'

set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :scm, :git

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :branch, ENV["BRANCH"] || "master"
set :use_sudo, false

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}"  }

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle
                     public/system public/backend/uploads}

set :default_env, {
  "LANG" => "en_US.UTF-8",
  "PATH" => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
set :keep_releases, 5

set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :nginx_site_conf, "/etc/nginx/sites-enabled/#{fetch(:application)}.conf"

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
fetch(:default_env).merge!(
  rails_env: fetch(:stage),
  rails_relative_url_root: "/backend"
)

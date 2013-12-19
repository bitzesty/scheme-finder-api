require "airbrake/capistrano"
require "hipchat/capistrano"

set :application, "scheme-finder-api"
set :repo_url, "git@github.com:bitzesty/#{application}.git"

set :hipchat_token, "94fcb0db90a76e9e61f4965a1f2f83"
set :hipchat_room_name, "BIS"
set :hipchat_announce, false
set :hipchat_color, "yellow"
set :hipchat_success_color, "green"
set :hipchat_failed_color, "red"

set :user, "schemer"
set :deploy_to, "/home/#{user}/#{application}"
set :scm, :git
set :deploy_via, :remote_cache

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :branch, "master"
set :use_sudo, false

set :whenever_command, "bundle exec whenever"
set :whenever_environment, defer { stage }
set :whenever_identifier, defer { "#{application}_#{stage}" }

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml config/unicorn.conf.rb}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle
                     public/system}

set :default_env, {
  "LANG" => "en_US.UTF-8",
  "PATH" => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH",
}
set :keep_releases, 5

set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
set :nginx_site_conf, "/etc/nginx/sites-enabled/#{application}.conf"

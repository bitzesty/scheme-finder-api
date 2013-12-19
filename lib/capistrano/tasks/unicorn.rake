namespace :unicorn do
  desc "Generate unicorn config files"
  task :server_config do
    unicorn_tmpl = ERB.new File.read("config/deploy/unicorn.conf.rb.erb")
    put unicorn_tmpl.result(binding), "#{shared_path}/config/unicorn.conf.rb"
  end
end

after 'deploy:update_code', 'unicorn:server_config'

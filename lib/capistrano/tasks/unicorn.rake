namespace :unicorn do
  desc "Generate unicorn config files"
  task :server_config do
    on roles(:web) do
      unicorn_tmpl = ERB.new File.read("config/deploy/unicorn.conf.rb.erb")
      puts "#{shared_path}"
      upload! StringIO.new(unicorn_tmpl.result(binding)), "#{shared_path}/config/unicorn.conf.rb"

      execute "ln -nfs #{shared_path}/config/unicorn.conf.rb \
                       #{release_path}/config/unicorn.conf.rb"
    end
  end
end

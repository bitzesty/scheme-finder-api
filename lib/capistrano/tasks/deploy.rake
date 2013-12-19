namespace :deploy do
  desc "Restart application"
  task :restart, except: { no_release: true } do
    on roles(:app) do
      run "start #{application} || restart #{application}"
    end
  end

  task :export_app, except: { no_release: true } do
    on roles(:app) do
      run "cd #{current_path} && \
           bundle exec foreman export upstart /home/#{user}/.init \
             -a #{user} \
             -f Procfile.#{rails_env} \
             -u #{user} \
             -l #{shared_path}/log \
             -t config/deploy/templates"
    end
  end

  task :start, except: { no_release: true } do
    on roles(:app) do
      run "start #{application}"
    end
  end

  task :stop, except: { no_release: true } do
    on roles(:app) do
      run "stop #{application}"
    end
  end

  task :restart, except: { no_release: true } do
    on roles(:app) do
      run "start #{application} || restart #{application}"
    end
  end
end

before "deploy:restart", "deploy:export_app"
after :finishing, "deploy:cleanup"

load 'deploy/assets'

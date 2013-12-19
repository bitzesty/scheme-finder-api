set :job_template, "env PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH /bin/bash -l -c ':job'"

set :output, File.expand_path("#{File.dirname __FILE__}/../log/cron_log.log")

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

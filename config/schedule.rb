 set :environment, "development"
 set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
<<<<<<< HEAD
# every 1.minute do 
# rake "db:seed"
# end
# every 1.minute do 
# rake "sms"
# end
=======
every 1.minute do 
rake "db:seed"
end

every 1.minute do 
	rake "sms"
end

>>>>>>> e6418a40f965b1135ac44f80ad3e6a8ad8cc2f73
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

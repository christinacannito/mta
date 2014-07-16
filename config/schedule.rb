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
every 1.minute do 
rake "db:seed"
end

every 1.minute do 
	rake "sms"
end

=======
# every 1.minute do 
# rake "db:seed"
# end
# every 1.minute do 
# rake "sms"
# end
>>>>>>> ac10c6742c7f3215ec7ee2b401b8b248f1309be1
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

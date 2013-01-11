require 'resque/tasks'
puts 'Worker started... Hit CTRL+C to stop'
task "resque:setup" => :environment

require 'rake'
module DbPopulate
  DBP_ROOT = File.dirname(__FILE__)
end

# prevent the task from being loaded multiple times.
unless Rake::Task.task_defined? "db:populate"
  # Load the rakefile so users of the gem get the tasks
  load File.join(DbPopulate::DBP_ROOT, '..', 'tasks', 'populate.rake')
end

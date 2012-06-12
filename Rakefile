require 'rubygems'

def require_local(folder_name)
  root_folder = File.dirname(__FILE__)
  subfolder = root_folder + "/#{folder_name}"
  $LOAD_PATH.unshift(subfolder) unless $LOAD_PATH.include?(subfolder)
end

require_local 'lib'

desc 'Default: run cucumber'
task :default => :features

# load Cucumber tasks
begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format pretty"
  end
  task :features
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
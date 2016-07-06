require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "terminal_crontab/version"
require "terminal_crontab/open_class/string"
require "terminal_crontab/crontab_time_list"
require "terminal_crontab/crontab_time_range"
require "terminal_crontab/crontab_time_step"
require "terminal_crontab/crontab_time_digit"
require "terminal_crontab/human"
require "terminal_crontab/crontab_time"
require "terminal_crontab/converter"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r terminal_crontab/version \
      -r terminal_crontab/open_class/string \
      -r terminal_crontab/crontab_time_list \
      -r terminal_crontab/crontab_time_range \
      -r terminal_crontab/crontab_time_step \
      -r terminal_crontab/crontab_time_digit \
      -r terminal_crontab/human \
      -r terminal_crontab/crontab_time \
      -r terminal_crontab/converter \
      -r byebug"
end

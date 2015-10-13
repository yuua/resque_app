require "bundler/setup"
require "resque/tasks"
require 'resque/scheduler/tasks'

Dir[File.dirname(__FILE__) + '/app/jobs/*.rb'].each { |f|  require f }

namespace :resque do
  require 'yaml'
  desc 'redisの設定'
  task :setup do
    Resque.redis = 'localhost:6379'
    Resque.logger = Logger.new("./log/resque.log")
    Resque.logger.level = Logger::WARN
  end

  desc 'jobのスケジュール設定'
  task :setup_schedule => :setup do
#     スケジュールのyaml
    Resque.schedule = YAML::load_file("./resque_schedule.yml")
  
  end

  desc 'task名をschedulerとする'
  task :scheduler => :setup_schedule
end

desc "workerの停止"
task :job_delete do
  Resque.workers.each { |w| w.unregister_worker }
end

task :default do
  Resque.enqueue(Yesterday)
end

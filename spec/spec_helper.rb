require "rubygems"
require 'bundler/setup'
require 'rspec'
require 'pry-rails'
require 'timecop'
# require 'resque/tasks'
# require 'resque/scheduler/tasks'
# require 'resque_spec'

Dir['./app/jobs/*.rb'].each { |f|  require f }
Dir['./app/lib/*.rb'].each { |f|  require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

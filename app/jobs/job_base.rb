require 'active_support'
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << './app/lib/'

require 'active_support/core_ext/object'

class JobBase

  @@env = nil

  def initialize
    if ENV['USER'] == 'hoge'
      @@env = '_dev'
    else
      # production php artisan path
      @@php_artisan = nil
    end
  end

  def get_now_day
    Time.now.strftime('%Y-%m-%d')
  end

  def get_now_month
    Time.now.strftime('%m')
  end

  def get_yesterday
    1.day.ago.strftime('%Y-%m-%d')
  end

  def get_one_hours_ago
    1.hours.ago.strftime('%H')
  end

end

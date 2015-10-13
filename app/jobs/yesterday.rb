require './app/jobs/job_base'
class Yesterday  < JobBase

  @queue = :yesterday

  def self.perform
    base = JobBase.new
    puts "#{base.get_yesterday}"
  end

end

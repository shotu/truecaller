class CreateCallStatsEmailsJobsWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'email', :retry => 0, :backtrace => true

  def perform
    puts "I am worker "
    CallStatsService.create_send_stats_email_jobs
  end

end
class SendStatsEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'create_send_email_jobs', :retry => 5, :backtrace => true

  def perform(user_id)
    CallStatsService.send_stats_email(user_id)
  end

end
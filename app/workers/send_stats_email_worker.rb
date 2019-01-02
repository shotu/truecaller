class SendStatsEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'email', :retry => 5, :backtrace => true

  def perform(user_id)
    CallStatsService.send_stats_email(user_id)
  end

end
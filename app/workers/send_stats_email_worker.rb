class SendStatsEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default', :retry => 0, :backtrace => true

  def perform(user_id)
    puts "I am worker "
    CallStatsService.send_stats_email(user_id)
  end

end
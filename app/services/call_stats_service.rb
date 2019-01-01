class CallStatsService

  def self.create_send_stats_email_jobs
    users = User.all.where(is_active: true)
    total_jobs = 0
    users.each_with_index do |user, index|
      Rails.logger.info "Creating stats email job for user :#{user.email}"
      job_id = SendStatsEmailWorker.perform_async(user.id)
      if !job_id.nil?
        total_jobs = total_jobs + 1
        Rails.logger.info "Total jobs created::#{total_jobs}"
      else
        raise "Not able to push job to queue for user_id: #{user.id}.Please retry or inform developer"
      end
    end
    return true
  end

  def self.send_stats_email(user_id)
    puts "Sending email to user_id.............. #{user_id}"
    # users = User.all.where(is_active: true)
    # total_jobs = 0
    # users.each_with_index do |user, index|
    #   Rails.logger.info "Creating stats email job for user :#{user.email}"
    #   total_jobs = total_jobs + 1
    #   Rails.logger.info "Total jobs created::#{total_jobs}"
    # end
    # return true
  end

end
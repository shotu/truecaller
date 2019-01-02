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

    user = User.find(user_id)
    data = get_last_week_calls_stat_for_user(user_id)

    if data && data[:results].count > 0
      email_service_inst = EmailService.new("admin@truecaller.com", user.email, "Your calls stats this week", data)
      email_service_inst.send_email_message()
    end
    Rails.logger.info "Not stats for user_id #{user_id} "
    return true
  end

  def self.get_last_week_calls_stat_for_user(user_id)

    # Here the date range is current date -1 day to previous 8days as we have send the stats till the end of day, current time can be any time of the day

    user_contacts_call_history_sql = "
          select
              user_contact_id,
              count(user_contact_id) as count,
              sum( end_time - start_time) as total_call_time
          from user_contact_call_histories
          where
              user_id = #{user_id} and
              is_active = true and
              start_time >= current_date - INTERVAL '8 DAY' and
              end_time  <   current_date - INTERVAL '1'
          group by user_contact_id
          order by count, total_call_time"
    results = ActiveRecord::Base.connection.execute(user_contacts_call_history_sql)
    count =  ActiveRecord::Base.connection.execute(user_contacts_call_history_sql).count # TODO revisit
    # puts results
    # puts count
    updated_result = []
    results.each_with_index do | data, index|
      contact_user_details = get_user_contact_details(data["user_contact_id"])
      data["contacted_user"] = contact_user_details
      updated_result << data
    end
    { results: updated_result.as_json, count: count }
  end

  def self.get_user_contact_details(user_contact_id)
    user_contact_details = UserContact.find(user_contact_id)
    user_contact_details
  end

end
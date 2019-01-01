Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{Figaro.env.redis_host}:#{Figaro.env.redis_port}/0", namespace: Figaro.env.sidekiq_redis_namespace }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{Figaro.env.redis_host}:#{Figaro.env.redis_port}/0", namespace: Figaro.env.sidekiq_redis_namespace }
end
schedule_file = "config/sidekiq-schedule.yml"
if File.exist?(schedule_file) && Sidekiq.server?
  main_api_scheduler_hash = YAML.load_file(schedule_file)
  Sidekiq::Cron::Job.load_from_hash main_api_scheduler_hash
end

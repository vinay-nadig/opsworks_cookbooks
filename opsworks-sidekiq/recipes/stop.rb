SIDEKIQ_PID = File.expand_path("./tmp/pids/sidekiq.pid", __FILE__)

execute "stop sidekiq" do
  command "bundle exec sidekiqctl stop #{SIDEKIQ_PID}"
end

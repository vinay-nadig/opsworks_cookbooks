SIDEKIQ_PID = File.expand_path("./tmp/pids/sidekiq.pid", __FILE__)

execute "stop sidekiq" do
  cwd File.join(deploy[:deploy_to], 'current')
  command "bundle exec sidekiqctl stop #{SIDEKIQ_PID}"
end

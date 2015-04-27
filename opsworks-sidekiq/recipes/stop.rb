SIDEKIQ_PID = File.expand_path("./tmp/pids/sidekiq.pid", __FILE__)

node[:deploy].each do |application, deploy|
  if application == 'salescraft-api'
    execute "stop sidekiq" do
      cwd File.join(deploy[:deploy_to], 'current')
      command "bundle exec sidekiqctl stop #{SIDEKIQ_PID}"
    end
  end
end

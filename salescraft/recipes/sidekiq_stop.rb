# stop Unicorn service per app
node[:deploy][0] do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping unicorn::rails application #{application} as it is not an Rails app")
    next
  end

  execute "stop unicorn" do
    command "kill `cat #{deploy[:deploy_to]}/shared/pids/sidekiq.pid`"
    only_if do
      File.exists?("#{deploy[:deploy_to]}/shared/pids/sidekiq.pid")
    end
  end
end

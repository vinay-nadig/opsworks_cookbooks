node[:deploy].each do |application, deploy|
  template "#{node[:deploy][application][:deploy_to]}/shared/config/newrelic.yml" do
    source "newrelic.yml.erb"
  end
end

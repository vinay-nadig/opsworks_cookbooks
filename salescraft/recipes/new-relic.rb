node[:deploy].each do |application, deploy|
  template "#{node[:deploy][application][:release_path]}/config/newrelic.yml" do
    source "newrelic.yml.erb"
  end
end

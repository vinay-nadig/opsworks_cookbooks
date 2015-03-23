template "#{node[:deploy][application][:current_path]}/config/newrelic.yml" do
  source "newrelic.yml.erb"
end
template "#{node[:deploy][:salescraft-api][:current_path]}/config/newrelic.yml" do
  source "newrelic.yml.erb"
end
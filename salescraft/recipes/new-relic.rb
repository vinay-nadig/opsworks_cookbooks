template "#{node[:deploy]["salescraft-api"][:deploy_to]}/shared/config/newrelic.yml" do
  source "newrelic.yml.erb"
end

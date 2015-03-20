# Populate database on one of the nodes
node[:deploy].each do |application, deploy|
  if node[:deploy][application][:rails_env] == 'production'
    Chef::Log.debug("Populating a production database is a bad idea. Now go stand in a corner and think about what you just did.")
    next
  end

  execute "populate database" do
    command default[:deploy][application][:populate_command]
    cwd default[:deploy][application][:current_path]
  end

  break
end

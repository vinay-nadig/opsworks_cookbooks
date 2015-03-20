# Populate database on one of the nodes
node[:deploy].each do |application, deploy|
  if node[:deploy][application][:rails_env] == 'production'
    Chef::Log.debug("Populating a production database is a bad idea. Now go stand in a corner and think about what you just did.")
    next
  end

  execute "drop database" do
    command node[:deploy][application][:drop_db_command]
    cwd node[:deploy][application][:current_path]
  end

  execute "create database" do
    command node[:deploy][application][:create_db_command]
    cwd node[:deploy][application][:current_path]
  end

  execute "migrate database" do
    command node[:deploy][application][:migrate_db_command]
    cwd node[:deploy][application][:current_path]
  end

  execute "populate database" do
    command node[:deploy][application][:populate_command]
    cwd node[:deploy][application][:current_path]
  end

  break
end

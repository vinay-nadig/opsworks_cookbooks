# Populate database on one of the nodes
node[:deploy].each do |application, deploy|
  if node[:deploy][application][:rails_env] == 'production'
    Chef::Log.warn("Dropping & Migrating a production database is a bad idea. I really hope you know exactly what you are doing.")
    next
  end

  Chef::Log.info("******Current Directory: #{node[:deploy][application][:current_path]} ******")

  Chef::Log.info("******Dropping database: #{node[:deploy][application][:drop_db_command]} ******")
  execute "drop database" do
    command node[:deploy][application][:drop_db_command]
    cwd node[:deploy][application][:current_path]
  end

  Chef::Log.info("******Creating database: #{node[:deploy][application][:create_db_command]} ******")
  execute "create database" do
    command node[:deploy][application][:create_db_command]
    cwd node[:deploy][application][:current_path]
  end

  Chef::Log.info("******Migrating database: #{node[:deploy][application][:migrate_db_command]} ******")
  execute "migrate database" do
    command node[:deploy][application][:migrate_db_command]
    environment ({ "SECRET_KEY_BASE" => Digest::SHA512.hexdigest(Time.now.to_s) })
    cwd node[:deploy][application][:current_path]
  end
end

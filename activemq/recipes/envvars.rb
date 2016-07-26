Chef::Log.info("REDIS_WRITABLE_IP: #{node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_IP]}")
Chef::Log.info("REDIS_WRITABLE_PORT: #{node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_PORT]}")

ruby_block  "set-app-var" do
  block do
    ENV["REDIS_WRITABLE_IP"] = node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_IP]
    ENV["REDIS_WRITABLE_PORT"] = node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_PORT]
  end
end

execute "export vars" do
  command "export REDIS_WRITABLE_IP=#{node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_IP]}"
  command "export REDIS_WRITABLE_PORT=#{node[:deploy]['charging_module'][:environment_variables][:REDIS_WRITABLE_PORT]}"
end

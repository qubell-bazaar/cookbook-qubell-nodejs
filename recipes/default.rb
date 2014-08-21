include_recipe "qubell-nodejs::nodejs_install"
include_recipe "qubell-nodejs::npm_install"
include_recipe "qubell-nodejs::npm_install_local"
include_recipe "qubell-nodejs::prestart_commands"
include_recipe "qubell-nodejs::start_commands"

if ( node['qubell-nodejs']['app_root'].start_with?('~') )
  node.set['qubell-nodejs']['app_root'] = node['qubell-nodejs']['app_root'].gsub('~', ENV['HOME'])
end
case node["platform_family"]
  when "rhel"
    service "iptables" do
      action :stop
    end
  when "debian"
    service "ufw" do
      action :stop
    end
  end

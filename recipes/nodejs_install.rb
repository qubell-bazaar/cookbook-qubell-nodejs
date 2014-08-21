case node['platform']
  when "ubuntu"
    execute "update packages cache" do
      command "apt-get update"
    end
  end

include_recipe "nodejs"
include_recipe "nodejs::npm"
bash "update npm" do
  cwd "/"
  code <<-EOH
    npm update npm -g
   EOH
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

case node['platform']
  when "ubuntu"
    execute "update packages cache" do
      command "apt-get update"
    end
  end

include_recipe "nodejs"
include_recipe "nodejs::npm"
bash "update npm" do
  cwd "#{node['qubell-nodejs']['app_root']}"
  code <<-EOH
    npm update npm -g
   EOH
end
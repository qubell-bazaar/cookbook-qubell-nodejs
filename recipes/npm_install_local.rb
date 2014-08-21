if (node['qubell-nodejs']['npm']['install_from_json'] != false)
  bash "npm install" do
     cwd "#{node['qubell-nodejs']['app_root']}"
      code <<-EOH
         npm install
       EOH
  end
end

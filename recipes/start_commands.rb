if (! node['qubell-nodejs']['start_commands'].empty?)
  node['qubell-nodejs']['start_commands'].each do |cmd|
    bash 'Run #{cmd}' do
      cwd "#{node['qubell-nodejs']['app_root']}"
       code <<-EOH
         #{cmd} 
        EOH
    end
  end
end 

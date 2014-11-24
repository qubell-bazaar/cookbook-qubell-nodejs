if (! node["qubell-nodejs"]["npm"]["packages"].empty?)
  node["qubell-nodejs"]["npm"]["packages"].each do |pkg|
    bash  'install #{pkg}' do
      cwd "#{node['qubell-nodejs']['app_root']}"
      code <<-EOH
         npm install #{pkg}
        EOH
    end
  end
end

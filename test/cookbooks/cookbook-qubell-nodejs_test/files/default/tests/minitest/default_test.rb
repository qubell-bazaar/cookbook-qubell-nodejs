require 'minitest/spec'

describe_recipe 'cookbook-qubell-tomcat::default' do
  it "creates solr_src folder" do
    assert File.directory?("#{node['qubell-nodejs']['app_root']}")
  end
end


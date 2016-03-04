execute 'chefdk' do
  command 'curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk'
end

node['opsworks-bootstrap']['cookbooks'].each do |cookbook|

  git "/var/chef/cookbooks/#{cookbook['name']}" do
    repository cookbook['repository']
    revision   cookbook['revision']
    action     :sync
  end

  execute "berks-#{cookbook['name']}" do
    command 'berks vendor ../'
    cwd     "/var/chef/cookbooks/#{cookbook['name']}"
  end

end

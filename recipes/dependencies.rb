yum_package 'chefdk'

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

include_recipe 'php'
include_recipe 'apache2'
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_php5"

package 'php5-mysql' do
  action :install
end

include_recipe 'mysql::server'
include_recipe 'nodejs'
include_recipe 'git'
include_recipe 'vim'

web_app 'joomla-development' do
  template 'web_app.conf.erb'
  docroot '/var/www/joomla-development/joomla'
end

include_recipe "database::mysql"

mysql_database 'joomla' do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

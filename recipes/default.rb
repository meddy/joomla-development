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
include_recipe 'tmux'
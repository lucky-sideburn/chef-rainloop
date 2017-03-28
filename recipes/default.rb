#
# Cookbook:: rainloop
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apache2'

include_recipe 'php'

include_recipe 'apache2::mod_php5'

node['rainloop']['php']['extensions'].each do |php_extension|
  php_pear php_extension do
    action :install
  end
end

package 'php-xml'

directory node['rainloop']['base'] do
  mode  '770'
  owner node['rainloop']['user']
  group node['rainloop']['group']
  recursive true
end

web_app 'rainloop' do
  server_name node['hostname']
  server_aliases [node['fqdn'], node['rainloop']['server_alias']]
  docroot File.join(node['rainloop']['base'])
  cookbook 'apache2'
  directory_options ['FollowSymLinks']
end

include_recipe 'rainloop::archive'

file_content = ''

node['rainloop']['domains'].each do |domain, _hash|
  node['rainloop']['domains'][domain].each do |key, value|
    file_content += "#{key}=''\n" if value.to_s.empty? && next
    file_content += "#{key}=#{value}\n"
  end
end

http_request 'first access' do
  action :get
  url "http://#{node['fqdn']}/index.php"
  # headers('host' => node['fqdn'])
end

node['rainloop']['domains'].keys.each do |domain|
  file File.join(node['rainloop']['base'], 'data', '_data_', '_default_', 'domains', "#{domain}.ini") do
    content file_content
    mode '0755'
    owner node['rainloop']['user']
    group node['rainloop']['group']
  end
end

# consider to make a recipe for automatic installation...
# curl -sL https://repository.rainloop.net/installer.php | php

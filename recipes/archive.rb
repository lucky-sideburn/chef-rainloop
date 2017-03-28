#
# Cookbook:: rainloop
# Recipe:: archive
#
# Copyright:: 2017, The Authors, All Rights Reserved.

%w(unzip rsync).each do |package|
  package package do
    action :install
  end
end

version = node['rainloop']['archive']['version']

ark 'rainloop' do
  url node['rainloop']['archive']['url']
  checksum node['rainloop']['archive']['checksum']
  path node['rainloop']['base']
  owner node['rainloop']['user']
  group node['rainloop']['group']
  mode 0o775
  action :put
  notifies :run, 'ruby_block[copy index.php]', :immediately
  notifies :run, 'execute[set_perms]', :immediately
end

index_php = File.join(node['rainloop']['base'], 'rainloop', 'v', node['rainloop']['archive']['version'], 'index.php.root')

ruby_block 'copy index.php' do
  block do
    FileUtils.cp(index_php, File.join(node['rainloop']['base'], 'index.php'))
  end
  action :nothing
end

execute 'set_perms' do
  command 'chmod -R 775 rainloop'
  cwd node['rainloop']['base']
  action :nothing
end

file_content = ''

node['rainloop']['domains'].each do |domain, _hash|
  node['rainloop']['domains'][domain].each do |key, value|
    file_content += "#{key}=''\n" if value.to_s.empty? && next
    file_content += "#{key}=#{value}\n"
  end
end

service 'apache2' do
  action :restart
  not_if { File.exist? File.join(node['rainloop']['base'], 'data') }
end

http_request 'first access' do
  action :get
  url "http://#{node['fqdn']}/index.php"
  not_if { File.exist? File.join(node['rainloop']['base'], 'data') }
end

node['rainloop']['domains'].keys.each do |domain|
  file File.join(node['rainloop']['base'], 'data', '_data_', '_default_', 'domains', "#{domain}.ini") do
    content file_content
    mode '0755'
    owner node['rainloop']['user']
    group node['rainloop']['group']
  end
end

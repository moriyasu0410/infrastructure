#
# Cookbook Name:: php55
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#       
# epel
remote_file "/tmp/#{node['epel']['file_name']}" do
        source "#{node['epel']['remote_uri']}"
        not_if { ::File.exists?("/tmp/#{node['epel']['file_name']}") }
end

package node['epel']['file_name'] do
        action :install
        provider Chef::Provider::Package::Rpm
        source "/tmp/#{node['epel']['file_name']}"
end

# remi
remote_file "/tmp/#{node['remi']['file_name']}" do
        source "#{node['remi']['remote_uri']}"
        not_if { ::File.exists?("/tmp/#{node['remi']['file_name']}") }
end

package node['remi']['file_name'] do
        action :install
        provider Chef::Provider::Package::Rpm
        source "/tmp/#{node['remi']['file_name']}"
end

# PHP 
%w{php php-devel php-mbstring php-mysql}.each do |p|
        package p do
                action :install
                options "--enablerepo=remi --enablerepo=remi-php55"
        end
end

# PHPUnit
execute "phpunit-install" do
        command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
        not_if { ::File.exists?("/usr/bin/phpunit")}
end

#template "php.ini" do
#        path "/etc/php.ini"
#        source "php.ini.erb"
#        mode 0644
#        notifies :restart, 'service[httpd]'
#end


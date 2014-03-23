#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
service "iptables" do
        action [:stop, :disable]
end 
#%w{php php-devel php-mbstring php-mcrypt php-mysql php-phpunit-PHPUnit php-pecl-xdebug}.each do |p|
#        package p do
#                action :install
#        end
#end 
package "httpd" do
    action :install
end
service "httpd" do
    action [:start, :enable]
end
#template "/var/www/html/index.html" do
#        source "index.html.erb"
#        mode 0644
#end


#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

package 'httpd'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

bash "inline script" do
  user "root"
  code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysites/"
end

service 'httpd' do
  action [:enable, :start]
end

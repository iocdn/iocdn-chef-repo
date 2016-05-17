#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
  notifies :run, 'bash[httpd_service_on]' , :immediately
end

bash "httpd_service_on" do
  action :nothing
  code <<-EOL
    chkconfig httpd on
  EOL
  notifies :start, 'service[httpd]'
end

service "httpd" do
  action :nothing
  supports :start => true, :reload => true
end

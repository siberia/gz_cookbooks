#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

#
# Global Zone
#
if node['virtualization']['role'] == "host"
  execute "sethostname" do
    command "hostname #{node['nodename']}"
    not_if { node['hostname'] == node['nodename'] }
  end

  file "/etc/nodename" do
    content node['hostname']
    owner "root"
    group "root"
    mode "0644"
  end
end

#
# Cookbook Name:: datacenter
# Recipe:: default
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

template "/.dcinfo" do
  source ".dcinfo.erb"
  owner "root"
  group "root"
  mode "0644"
end

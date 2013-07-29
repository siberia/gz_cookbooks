#
# Cookbook Name:: base
# Recipe:: mbuffer
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/opt/custom/bin/mbuffer" do
  source "mbuffer"
  owner "root"
  group "root"
  mode "0750"
end

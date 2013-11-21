#
# Cookbook Name:: base
# Recipe:: sdcerize
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

#
# Makes SmartOS behave like SmartDataCenter (i.e. /etc/shadow is pulled from /usbkey)
#

execute "umount /etc/shadow" do
  command "umount /etc/shadow"
  only_if "mount | grep '/etc/shadow'"
end

execute "cp -pr /usbkey/shadow /etc/shadow" do
  command "cp -pr /usbkey/shadow /etc/shadow"
end

#
# Cookbook Name:: base
# Recipe:: writekey
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

#
# Deploy the writekey script only on servers which have removable usb keys
#
cookbook_file "/opt/custom/bin/writekey" do
  source "writekey"
  owner "root"
  group "root"
  mode "0750"
  only_if "diskinfo -H | nawk 'BEGIN { FS = \"[\\t]*|[\\t]+\" } { if ($6 == \"yes\" && $1 == \"USB\") print $2 }'"
end

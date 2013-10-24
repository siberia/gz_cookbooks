#
# Cookbook Name:: dtrace-cloud-tools
# Recipe:: default
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

git "/opt/custom/dtrace-cloud-tools" do
  repository "git://github.com/brendangregg/dtrace-cloud-tools.git"
  reference "master"
  user "root"
  group "root"
  action :checkout
  not_if "test -d /opt/custom/dtrace-cloud-tools"
end

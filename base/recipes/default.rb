#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

directory "/opt/custom" do
  action :create
end

directory "/opt/custom/bin" do
  action :create
end

#include_recipe "base::arcstat"
include_recipe "base::imgadm"
include_recipe "base::mbuffer"
include_recipe "base::pkgsrc"
include_recipe "base::pkgsrc-packages"
include_recipe "base::writekey"

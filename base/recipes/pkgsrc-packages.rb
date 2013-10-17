#
# Cookbook Name:: base
# Recipe:: pkgsrc-packages
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

%w{
  gsed
  scmgit
  screen
}.each do |p|
  package p do
    action :install
  end
end

#
# Cookbook Name:: root-user-env
# Recipe:: default
#
# Copyright 2012-2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

directory "/root" do
  owner "root"
  group "root"
  mode "0700"
end

directory "/root/.chef" do
  owner "root"
  group "root"
  mode "0750"
end

directory "/root/bin" do
  owner "root"
  group "root"
  mode "0750"
end

%w{
  .bash_profile
  .bashrc
  .chef/knife.rb
  .gitconfig
  .profile
  .vimrc
}.each do |f|
  cookbook_file "/root/#{f}" do
    source "#{f}"
    owner "root"
    group "root"
    mode "0644"
  end
end

%w{
  bin/chef-run
  bin/mbuffer
  bin/z
}.each do |f|
  cookbook_file "/root/#{f}" do
    source "#{f}"
    owner "root"
    group "root"
    mode "0750"
  end
end

#%w{
#  .ssh/config
#}.each do |f|
#   cookbook_file "/root/#{f}" do
#     source "#{f}"
#     owner "root"
#     group "root"
#     mode "0600"
#   end
#end

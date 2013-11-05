#
# Cookbook Name:: base
# Recipe:: pkgsrc
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/bootstrap-#{node['base']['pkgsrc_version']}-#{node['base']['pkgsrc_arch']}.tar.gz" do
  source "http://pkgsrc.joyent.com/packages/SmartOS/bootstrap/bootstrap-#{node['base']['pkgsrc_version']}-#{node['base']['pkgsrc_arch']}.tar.gz"
  checksum "1b1d49e596e22bfd700a3f7f0e820c63d3b1e3d6a03330d9ee5a9923a62795e4"
end

execute "untar-pkgsrc-tarball" do
  command "(cd / && gtar -zxf #{Chef::Config[:file_cache_path]}/bootstrap-#{node['base']['pkgsrc_version']}-#{node['base']['pkgsrc_arch']}.tar.gz)"
  not_if "test -d /opt/local"
end

execute "pkgin-update" do
  command "pkgin -yf up"
end

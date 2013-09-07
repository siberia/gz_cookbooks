#
# Cookbook Name:: base
# Recipe:: imgadm
#
# Copyright 2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

#
# Do not use %w{ }.each as we cannot have comments of what UUID matches which
# dataset
#
datasets = [
  'f669428c-a939-11e2-a485-b790efc0f0c1',  # base-13.1.0
  '9eac5c0c-a941-11e2-a7dc-57a6b041988f',  # base64-13.1.0
  '3882b5da-b0e8-11e2-b3a9-dbcf26c3e051',  # percona-13.1.0
  'beb2dbd4-b26f-11e2-8ad4-935c80092aa6',  # nodejs-13.1.0
  'e3364212-05c0-11e3-9576-3f3ee9e951a7',  # base-13.2.0
  '0084dad6-05c1-11e3-9476-8f8320925eea',  # base64-13.2.0
].each do |dataset|
  execute "install-dataset-#{dataset}" do
    command "imgadm import #{dataset}"
    creates "/zones/#{dataset}"
    not_if "imgadm list | grep '^#{dataset}'"
  end
end

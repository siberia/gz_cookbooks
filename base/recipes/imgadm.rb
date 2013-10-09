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
  '34509f68-1ae7-11e3-b816-d3edf71c7840',  # standard-13.2.0
  '399775e4-163e-11e3-8d42-7b14b732ae17',  # standard64-13.2.0
  'ec5defa8-16fe-11e3-948e-8f59b3488902',  # mongodb-13.2.0
  '4b4c141e-1fb4-11e3-a10e-6f99cfdf8806',  # stm-developer-13.2.0
  'b83f8276-1fdd-11e3-989b-4bddb088a8a0',  # base-13.2.1
  '17c98640-1fdb-11e3-bf51-3708ce78e75a',  # base64-13.2.1
  'ffed3d9e-2c2f-11e3-9a12-bf5267821b0b',  # nodejs-13.2.1
].each do |dataset|
  execute "install-dataset-#{dataset}" do
    command "imgadm import #{dataset}"
    creates "/zones/#{dataset}"
    not_if "imgadm list | grep '^#{dataset}'"
  end
end

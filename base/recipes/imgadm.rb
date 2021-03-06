#
# Cookbook Name:: base
# Recipe:: imgadm
#
# Copyright 2013-2014, Jacques Marneweck
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
  'dac2ad6e-2aa5-11e3-885f-8fd408fc6a82',  # standard-13.2.1
  'b779b49a-29e4-11e3-9b1d-0b0b41ccdcad',  # standard64-13.2.1
  'd2409672-29f3-11e3-ba86-6f782523cb41',  # mongodb-13.2.1
  '133263be-3c2c-11e3-8d3a-a30c43ae58fd',  # nodejs-13.2.2
  '610e04c4-3cc4-11e3-9867-df64b21b66fe',  # standard64-13.2.3
  '56a0655c-3cc6-11e3-9c79-5701599fdf05',  # standard-13.2.3
  'a1d74530-4212-11e3-8a71-a7247697c8f2',  # multiarch-13.3.0
  '7fa676e2-4709-11e3-916d-83ffcd857200',  # sngl-13.3.0
  '753ceee6-5372-11e3-8f4e-f79c1154e596',  # base-13.3.0
  '87b9f4ac-5385-11e3-a304-fb868b82fe10',  # base64-13.3.0
  '4aec529c-55f9-11e3-868e-a37707fcbe86',  # multiarch-13.3.1
  '75ec04ce-55fe-11e3-9252-afb57e4da368',  # sngl-13.3.1
  'fb6e7820-60ee-11e3-93b6-7f34ea3f2616',  # percona-13.3.0
  'dee73ee2-69ab-11e3-b593-a3f1f80ef403',  # base-13.3.1
  'c353c568-69ad-11e3-a248-db288786ea63',  # base64-13.3.1
  '2b683a82-a066-11e3-97ab-2faa44701c5a',  # base-13.4.0
  'ff86eb8a-a069-11e3-ae0e-4f3c8983a91c',  # base64-13.4.0
  '835e27b2-a47e-11e3-9eb6-e78ef6d1ee8f',  # postgresql-13.3.1
  '7241e29a-a07b-11e3-9a5c-53df1db058c4',  # base-13.4.1
  'c3321aac-a07c-11e3-9430-fbb1cc12d1df',  # base64-13.4.1
  'edd43ca8-c0ee-11e3-a027-c3a9f2cd2f6a',  # stm-developer-13.4.1
  '19edf83a-c674-11e3-af63-a78d671948c1',  # base-13.4.2
  'dc0688b2-c677-11e3-90ac-13373101c543',  # base64-13.4.2
  '9ab3f722-d136-11e3-9f3a-6fcb23726ee3',  # percona-13.4.2
  'caac17a4-d512-11e3-9d41-b756aebcb18f',  # base-14.1.0
  '8639203c-d515-11e3-9571-5bf3a74f354f',  # base64-14.1.0
  'a2969206-d604-11e3-be79-dfd0c3676b44',  # ghost-13.4.2
].each do |dataset|
  execute "install-dataset-#{dataset}" do
    command "imgadm import #{dataset}"
    creates "/zones/#{dataset}"
    not_if "imgadm list | grep '^#{dataset}'"
  end
end

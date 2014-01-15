#
# Cookbook Name:: base
# Attributes:: default
#
# Copyright 2013-2014, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

default['base'] = {
  'ntp' => {
    'servers' => [
      '0.pool.ntp.org',
      '1.pool.ntp.org',
      '2.pool.ntp.org'
    ]
  },
  'pkgsrc_version' => '2013Q3',
  'pkgsrc_arch' => 'i386'
}

name             'datacenter'
maintainer       'Jacques Marneweck'
maintainer_email 'jacques@powertrip.co.za'
license          'All rights reserved'
description      'Sets some variables to set which datacenter a headnode/compute node resides in'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

%w{
  smartos
}.each do |os|
  supports os
end

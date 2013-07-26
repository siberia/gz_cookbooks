# .chef/knife.rb
# SEE: http://wiki.opscode.com/display/chef/Troubleshooting+and+Technical+FAQ
# set some sensible defaults
current_dir = File.dirname(__FILE__)
user        = ENV['OPSCODE_USER'] || ENV['USER']

log_level                :debug
log_location             STDOUT
node_name                `hostname`
client_key               ''
validation_client_name   ''
validation_key           "#{current_dir}/validation.pem"
chef_server_url          ''
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
#cookbook_path           "#{current_dir}/../cookbooks"
cookbook_path            '/var/chef/cookbooks'
cookbook_copyright       'Jacques Marneweck'
cookbook_license         'none'
cookbook_email           'jacques@powertrip.co.za'
#environment_path         "#{current_dir}/../environments"
environment_path '/var/chef/environments'

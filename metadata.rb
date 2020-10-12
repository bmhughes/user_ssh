name 'user_ssh'
maintainer 'Ben Hughes'
maintainer_email 'bmhughes@bmhughes.co.uk'
license 'Apache-2.0'
description 'Configures user SSH keys and options'
version '0.2.1'
chef_version '>= 16.0'

issues_url 'https://github.com/bmhughes/user_ssh/issues'
source_url 'https://github.com/bmhughes/user_ssh'

%w(centos fedora redhat debian ubuntu).each { |os| supports os }

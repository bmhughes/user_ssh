#
# Cookbook:: user_ssh
# Spec:: known_host_spec
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>

require 'spec_helper'

describe 'user_ssh_authorized_key' do
  step_into :user_ssh_known_host
  platform 'centos'

  context 'create an authorized key file verify file is created properly' do
    recipe do
      user_ssh_known_host 'testhost' do
        user 'root'
        key 'AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAInmlzdHAyNTYAAABBBMGCI1q4BvctMzIPGRwLZsyZRjbIzy0Qmai8gJd+rVvmbBzqhjSspKkHeKUOQSEc+JTsP/JjFdUgEii83uWTsm0='
        keytype 'ecdsa-sha2-nistp256'
      end
    end

    it 'Creates the class configuration file correctly' do
      is_expected.to render_file('/root/.ssh/known_hosts')
        .with_content(%r{testhost ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAInmlzdHAyNTYAAABBBMGCI1q4BvctMzIPGRwLZsyZRjbIzy0Qmai8gJd\+rVvmbBzqhjSspKkHeKUOQSEc\+JTsP/JjFdUgEii83uWTsm0=})
    end
  end
end

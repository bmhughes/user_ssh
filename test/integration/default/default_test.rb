# InSpec test for recipe user_ssh

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe directory('/home/testuser01/.ssh') do
  it { should exist }
end

describe file('/home/testuser01/.ssh/authorized_keys') do
  it { should exist }
  its('type') { should cmp 'file' }
  it { should be_file }
  it { should_not be_directory }
  its('owner') { should eq 'testuser01' }
  its('group') { should eq 'testuser01' }
  its('content') { should match %r{ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0JNuXwaB8T/3pR/MqehUn0tjt0jN8Cgf6PuSS1YZRUDc7T6mFGphO04/YzSIBsWdWKZe2uWgzJJkUGN815ua7CYQktfDVMRx12baBAtLsqeseheUSxlJhg5oA1NckpdXuN7ca3vAl6Rc6P/Njj10OPglRX17/J284KOXCkg\+LDr6pJEglxXETJLiip7XSy70E/T14QkjlzFIFTU9xkb1\+\+p2wLxNI2qAPaZZHN9LrNHeq8t129psc8jnkAEGMjufGJuyZKZCAEcr6/Na9kGoJbv5vi0WieCvL22sdA3hCuMrPcFkqYIz9RysOzwRwX/IdkSg5Jv5b9CZuMskA5Kb9Q== Test Key 01} }
end

describe file('/home/testuser01/.ssh/known_hosts') do
  it { should exist }
  its('type') { should cmp 'file' }
  it { should be_file }
  it { should_not be_directory }
  its('owner') { should eq 'testuser01' }
  its('group') { should eq 'testuser01' }
  its('content') { should match %r{testhost ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAInmlzdHAyNTYAAABBBMGCI1q4BvctMzIPGRwLZsyZRjbIzy0Qmai8gJd\+rVvmbBzqhjSspKkHeKUOQSEc\+JTsP/JjFdUgEii83uWTsm0=} }
end

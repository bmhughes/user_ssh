# user_ssh

Manage user SSH authorized keys and known hosts.

## Platforms

- Debian / Ubuntu
- RHEL/CentOS and derivatives
- Fedora and derivatives

## Requirements

- Chef 16+

## Usage

It is recommended to create a project or organization specific [wrapper cookbook](https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/) and add the desired custom resources to the run list of a node.

Example of adding an authorized key and known host to user `testuser01`

```ruby
user_ssh_known_host 'testhost' do
  user 'testuser01'
  key 'AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAInmlzdHAyNTYAAABBBMGCI1q4BvctMzIPGRwLZsyZRjbIzy0Qmai8gJd+rVvmbBzqhjSspKkHeKUOQSEc+JTsP/JjFdUgEii83uWTsm0='
  keytype 'ecdsa-sha2-nistp256'
end

user_ssh_authorized_key 'testuser01_key01' do
  user 'testuser01'
  key 'AAAAB3NzaC1yc2EAAAABJQAAAQEA0JNuXwaB8T/3pR/MqehUn0tjt0jN8Cgf6PuSS1YZRUDc7T6mFGphO04/YzSIBsWdWKZe2uWgzJJkUGN815ua7CYQktfDVMRx12baBAtLsqeseheUSxlJhg5oA1NckpdXuN7ca3vAl6Rc6P/Njj10OPglRX17/J284KOXCkg+LDr6pJEglxXETJLiip7XSy70E/T14QkjlzFIFTU9xkb1++p2wLxNI2qAPaZZHN9LrNHeq8t129psc8jnkAEGMjufGJuyZKZCAEcr6/Na9kGoJbv5vi0WieCvL22sdA3hCuMrPcFkqYIz9RysOzwRwX/IdkSg5Jv5b9CZuMskA5Kb9Q=='
  comment 'Test Key 01'
end
```

## Examples

Please check for more varied working examples in the [test cookbook](./test/cookbooks/test/).

## Resources

- [user_ssh_authorized_key](documentation/user_ssh_authorized_key.md)
- [user_ssh_known_host](documentation/user_ssh_known_host.md)

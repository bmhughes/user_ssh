#
# Cookbook:: user_ssh
# Spec:: authorized_key_spec
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>

require 'spec_helper'

describe 'user_ssh_authorized_key' do
  step_into :user_ssh_authorized_key
  platform 'centos'

  context 'create an authorized key file verify file is created properly' do
    recipe do
      user_ssh_authorized_key 'root_key01' do
        user 'root'
        key 'AAAAB3NzaC1yc2EAAAABJQAAAQEA0JNuXwaB8T/3pR/MqehUn0tjt0jN8Cgf6PuSS1YZRUDc7T6mFGphO04/YzSIBsWdWKZe2uWgzJJkUGN815ua7CYQktfDVMRx12baBAtLsqeseheUSxlJhg5oA1NckpdXuN7ca3vAl6Rc6P/Njj10OPglRX17/J284KOXCkg+LDr6pJEglxXETJLiip7XSy70E/T14QkjlzFIFTU9xkb1++p2wLxNI2qAPaZZHN9LrNHeq8t129psc8jnkAEGMjufGJuyZKZCAEcr6/Na9kGoJbv5vi0WieCvL22sdA3hCuMrPcFkqYIz9RysOzwRwX/IdkSg5Jv5b9CZuMskA5Kb9Q=='
        comment 'Test Key 01'
      end
    end

    it 'Creates the class configuration file correctly' do
      is_expected.to render_file('/root/.ssh/authorized_keys')
        .with_content(%r{ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0JNuXwaB8T/3pR/MqehUn0tjt0jN8Cgf6PuSS1YZRUDc7T6mFGphO04/YzSIBsWdWKZe2uWgzJJkUGN815ua7CYQktfDVMRx12baBAtLsqeseheUSxlJhg5oA1NckpdXuN7ca3vAl6Rc6P/Njj10OPglRX17/J284KOXCkg\+LDr6pJEglxXETJLiip7XSy70E/T14QkjlzFIFTU9xkb1\+\+p2wLxNI2qAPaZZHN9LrNHeq8t129psc8jnkAEGMjufGJuyZKZCAEcr6/Na9kGoJbv5vi0WieCvL22sdA3hCuMrPcFkqYIz9RysOzwRwX/IdkSg5Jv5b9CZuMskA5Kb9Q== Test Key 01})
    end
  end
end
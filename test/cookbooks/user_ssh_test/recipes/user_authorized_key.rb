#
# Cookbook:: user_ssh_test
# Recipe:: user_authorized_key
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

user_ssh_authorized_key 'testuser01_key01' do
  user 'testuser01'
  key 'AAAAB3NzaC1yc2EAAAABJQAAAQEA0JNuXwaB8T/3pR/MqehUn0tjt0jN8Cgf6PuSS1YZRUDc7T6mFGphO04/YzSIBsWdWKZe2uWgzJJkUGN815ua7CYQktfDVMRx12baBAtLsqeseheUSxlJhg5oA1NckpdXuN7ca3vAl6Rc6P/Njj10OPglRX17/J284KOXCkg+LDr6pJEglxXETJLiip7XSy70E/T14QkjlzFIFTU9xkb1++p2wLxNI2qAPaZZHN9LrNHeq8t129psc8jnkAEGMjufGJuyZKZCAEcr6/Na9kGoJbv5vi0WieCvL22sdA3hCuMrPcFkqYIz9RysOzwRwX/IdkSg5Jv5b9CZuMskA5Kb9Q=='
end

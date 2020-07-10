#
# Cookbook:: user_ssh_test
# Recipe:: known_host
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk> <bmhughes@bmhughes.co.uk>
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

user_ssh_known_host 'testhost' do
  user 'testuser01'
  key 'AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAInmlzdHAyNTYAAABBBMGCI1q4BvctMzIPGRwLZsyZRjbIzy0Qmai8gJd+rVvmbBzqhjSspKkHeKUOQSEc+JTsP/JjFdUgEii83uWTsm0='
  keytype 'ecdsa-sha2-nistp256'
end

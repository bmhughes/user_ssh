#
# Cookbook:: user_ssh
# Resource:: _user_ssh (Partial)
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

include UserSsh::Cookbook::GeneralHelpers

property :cookbook, String,
          default: 'user_ssh',
          description: 'Cookbook to source file template from'

property :user, [Integer, String],
          required: true,
          description: 'Owner of the generated file'

property :group, [Integer, String],
          default: lazy { user },
          description: 'Group of the generated file'

property :mode, String,
          default: '0600',
          description: 'Filemode of the generated file'

property :ssh_generate_file, String,
          default: lazy { ::File.join(home, '.ssh', user_ssh_file) }

property :home, String,
          default: lazy { user_home_dir }

property :options, [String, Array],
          coerce: proc { |p| p.is_a?(Array) ? p.join(',') : p }

property :keytype, String,
          equal_to: %w(ecdsa-sha2-nistp256 ecdsa-sha2-nistp384 ecdsa-sha2-nistp384 ecdsa-sha2-nistp521 ssh-ed25519 ssh-dss ssh-rsa),
          default: 'ssh-rsa'

property :key, String,
          required: true

property :validate_key, [true, false],
          default: true

action_class do
  include UserSsh::Cookbook::ResourceHelpers
end

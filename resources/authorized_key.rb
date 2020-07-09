#
# Cookbook:: user_ssh
# Resource:: authorized_key
#
# Copyright:: 2020, Ben Hughes
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
include UserSsh::Cookbook::ResourceHelpers

property :cookbook, String,
          default: 'user_ssh',
          description: 'Cookbook to source configuration file template from'

property :template, String,
          default: 'authorized_keys.erb',
          description: 'Template to use to generate the configuration file'

property :owner, String,
          default: lazy { user },
          description: 'Owner of the generated configuration file'

property :group, String,
          default: lazy { user },
          description: 'Group of the generated configuration file'

property :mode, String,
          default: '0600',
          description: 'Filemode of the generated configuration file'

property :authorized_key_file, String,
          default: lazy { user_authorized_key_file }

property :user, [Integer, String],
          required: true

property :options, [String, Array],
          coerce: proc { |p| p.is_a?(Array) ? p.join(',') : p }

property :key_type, String,
          default: 'ssh-rsa'

property :key, String,
          required: true

property :comment, String,
          default: lazy { new_resource.name }

action :create do
  directory user_home_ssh_dir do
    recursive true

    user new_resource.user
    group new_resource.user
    mode '0600'
  end

  init_authorized_key_file_resource

  key = {
    options: new_resource.options,
    key_type: new_resource.key_type,
    key: new_resource.key,
    comment: new_resource.comment,
  }

  authorized_key_file_resource.variables['keys'] ||= []
  authorized_key_file_resource.variables['keys'].push(key)
end

action :delete do
  init_authorized_key_file_resource

  authorized_key_file_resource.variables['keys'].delete(key) unless nil_or_empty(authorized_key_file_resource.variables['keys'])
end

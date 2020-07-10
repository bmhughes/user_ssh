#
# Cookbook:: user_ssh
# Resource:: known_host
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

use 'user_ssh'

property :template, String,
          default: 'known_hosts.erb',
          description: 'Template to use to generate the configuration file'

property :host, String,
          name_property: true

action :create do
  key_valid?
  init_ssh_template_resource

  ssh_template_resource.variables['hosts'] ||= []
  ssh_template_resource.variables['hosts'].push(key_hash)
end

action :delete do
  init_ssh_template_resource

  ssh_template_resource.variables['keys'].delete(key_hash) unless nil_or_empty(authorized_key_file_resource.variables['keys'])
end
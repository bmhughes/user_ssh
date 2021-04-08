#
# Cookbook:: user_ssh
# Library:: resource
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>, All Rights Reserved.

module UserSsh
  module Cookbook
    module ResourceHelpers
      KEY_REGEX ||= %r{^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$}x.freeze

      def init_ssh_template_resource
        create_ssh_template_resource unless ssh_template_resource_exist?
      end

      def ssh_template_resource
        find_resource!(:template, new_resource.ssh_generate_file)
      end

      def key_valid?
        raise ArgumentError, 'Key validation failed' unless KEY_REGEX.match?(new_resource.key) || !new_resource.validate_key
      end

      def key_hash
        case new_resource.declared_type
        when :user_ssh_authorized_key
          {
            options: new_resource.options,
            keytype: new_resource.keytype,
            key: new_resource.key,
            comment: new_resource.comment,
          }
        when :user_ssh_known_host
          {
            host: new_resource.host,
            keytype: new_resource.keytype,
            key: new_resource.key,
          }
        else
          raise "key_hash: Unsupported resource #{new_resource.declared_type}"
        end
      end

      private

      def ssh_template_resource_exist?
        begin
          r = find_resource!(:template, new_resource.ssh_generate_file)
        rescue Chef::Exceptions::ResourceNotFound
          return false
        end

        return true unless r.nil?

        false
      end

      def create_ssh_template_resource
        with_run_context :root do
          edit_resource(:directory, new_resource.home) do
            user new_resource.user
            group new_resource.group
            mode '0700'
          end unless ::Dir.exist?(new_resource.home)

          edit_resource(:directory, ::File.join(new_resource.home, '.ssh')) do
            user new_resource.user
            group new_resource.group
            mode '0700'
          end

          edit_resource(:template, new_resource.ssh_generate_file) do
            source new_resource.template
            cookbook new_resource.cookbook

            owner new_resource.user
            group new_resource.group
            mode new_resource.mode
            sensitive new_resource.sensitive

            helpers(UserSsh::Cookbook::GeneralHelpers)
            helpers(UserSsh::Cookbook::TemplateHelpers)

            action :nothing
            delayed_action :create
          end
        end
      end
    end
  end
end

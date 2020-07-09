#
# Cookbook:: user_ssh
# Library:: resource
#
# Copyright:: 2020, Ben Hughes, All Rights Reserved.

module UserSsh
  module Cookbook
    module ResourceHelpers
      def init_authorized_key_file_resource
        create_authorized_key_file_resource unless authorized_key_file_resource_exist?
      end

      def authorized_key_file_resource
        find_resource!(:template, new_resource.authorized_key_file)
      end

      private

      def authorized_key_file_resource_exist?
        begin
          r = find_resource!(:template, new_resource.authorized_key_file)
        rescue Chef::Exceptions::ResourceNotFound
          return false
        end

        return true unless r.nil?

        false
      end

      def create_authorized_key_file_resource
        with_run_context :root do
          edit_resource(:template, new_resource.authorized_key_file) do
            source new_resource.template
            cookbook new_resource.cookbook

            owner new_resource.owner
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

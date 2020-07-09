#
# Cookbook:: user_ssh
# Library:: general
#
# Copyright:: 2020, Ben Hughes, All Rights Reserved.

module UserSsh
  module Cookbook
    module GeneralHelpers
      def user_home_ssh_dir
        "#{Dir.home(new_resource.user)}/.ssh"
      end

      def user_authorized_key_file
        "#{user_home_ssh_dir}/authorized_keys"
      end

      def nil_or_empty?(property)
        return true if property.nil? || safe_empty?(property)

        false
      end

      def safe_empty?(property)
        return true if property.respond_to?(:empty?) && property.empty?

        false
      end
    end
  end
end

#
# Cookbook:: user_ssh
# Library:: general
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>, All Rights Reserved.

require 'etc'

module UserSsh
  module Cookbook
    module GeneralHelpers
      def user_home_dir
        Dir.home(user)
      end

      def user_ssh_file
        case declared_type
        when :user_ssh_authorized_key
          'authorized_keys'
        when :user_ssh_known_host
          'known_hosts'
        else
          raise "user_ssh_file: Unsupported resource #{declared_type}"
        end
      end

      def user_primary_group(user)
        raise_error(type: ArgumentError) unless user.is_a?(String) || user.is_a?(Integer)

        user_passwd = case user
                      when String
                        Etc.getpwnam(user)
                      when Integer
                        Etc.getpwuid(user)
                      end

        Etc.getgrgid(user_passwd.gid).name
      end

      def comment_default
        return comment unless nil_or_empty?(comment)
        return name unless nil_or_empty?(name)

        nil
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

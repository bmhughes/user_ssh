#
# Cookbook:: user_ssh
# Library:: template
#
# Copyright:: Ben Hughes <bmhughes@bmhughes.co.uk>, All Rights Reserved.

include UserSsh::Cookbook::GeneralHelpers

module UserSsh
  module Cookbook
    module TemplateHelpers
      def authorized_key_builder(key)
        raise ArgumentError, "user_authorized_key_builder: Expected Hash, got #{key.class}." unless key.is_a?(Hash)

        key_string = ''

        %i(options keytype key comment).each do |v|
          next if nil_or_empty?(key[v])

          key_string.concat("#{key[v]} ")
        end

        key_string.strip
      end

      def known_host_builder(key)
        raise ArgumentError, "known_host_builder: Expected Hash, got #{key.class}." unless key.is_a?(Hash)

        host_string = ''

        %i(host keytype key).each do |v|
          next if nil_or_empty?(key[v])

          host_string.concat("#{key[v]} ")
        end

        host_string.strip
      end
    end
  end
end

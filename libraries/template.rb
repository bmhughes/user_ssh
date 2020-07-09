#
# Cookbook:: user_ssh
# Library:: template
#
# Copyright:: 2020, Ben Hughes, All Rights Reserved.

include UserSsh::Cookbook::GeneralHelpers

module UserSsh
  module Cookbook
    module TemplateHelpers
      def user_authorized_key_builder(key)
        raise ArgumentError, "user_authorized_key_builder: Expected Hash, got #{key.class}." unless key.is_a?(Hash)

        key_string = ''

        %i(options key_type key comment).each do |v|
          next if nil_or_empty(key[v])

          key_string.concat("#{key[v]} ")
        end

        key_string.strip
      end
    end
  end
end

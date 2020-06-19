# typed: strict
# frozen_string_literal: true

module Lollipop
  module Gems
    class Rubocop
      include Lollipop::Gem

      sig { void }
      def initialize
        @name = T.let nil, String
        @binstubs = T.let nil, T::Array[String]
      end

      sig { returns String }
      attr_reader :name

      sig { returns T::Array[String] }
      attr_reader :binstubs

      sig { returns T::Boolean }
      def set_required?
      end

      private

      sig { void }
      def install_bundled
      end

      sig { void }
      def install_unbundled
      end

      sig { void }
      def install_bundled!
      end

      sig { void }
      def install_unbundled!
      end
    end
  end
end

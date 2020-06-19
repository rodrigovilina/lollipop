# typed: strict
# frozen_string_literal: true

module Lollipop
  module Gems
    class Rubocop
      include Lollipop::Gem

      def initialize
        @name = 'rubocop'
        @binstubs = ['rubocop']

        super
      end

      attr_reader :name, :binstubs

      def set_required?
        !!defined?(::Rubocop)
      end

      private

      def install_bundled
        if bundled?
          $stdout.puts "#{name} already bundled"
        else
          install_bundled!
        end
      end

      def install_bundled!
        $stdout.puts "bundling #{name}"
        `echo "gem 'rubocop', require: false" >> Gemfile`
        `echo "gem 'rubocop-performance', require: false" >> Gemfile`
      end

      def install_unbundled
        if installed?
          $stdout.puts "#{name} already installed"
        else
          install_unbundled!
        end
      end

      def install_unbundled!
        $stdout.puts "installing #{name}"
        puts `gem install rubocop rubocop-performance`
      end
    end
  end
end

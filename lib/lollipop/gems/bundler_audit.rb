# typed: strict
# frozen_string_literal: true

module Lollipop
  module Gems
    class BundlerAudit
      include Lollipop::Gem

      def initialize
        @name = 'bundler-audit'
        @binstubs = %w[bundle-audit bundler-audit]

        super
      end

      attr_reader :name, :binstubs

      def set_required?
        !!defined?(::Bundler::Audit)
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
        `echo "gem 'bundler-audit', require: false" >> Gemfile`
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
        puts `gem install bundler-audit`
      end
    end
  end
end

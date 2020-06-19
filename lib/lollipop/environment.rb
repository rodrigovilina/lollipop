# typed: strict
# frozen_string_literal: true

module Lollipop
  module Environment
    def self.rbenv?
      !!ENV['RBENV_VERSION']
    end

    def self.bundler?
      !!ENV['BUNDLER_VERSION']
    end

    def self.lockfile_gems
      require 'bundler'

      Bundler::LockfileParser.new(
        Bundler.read_file(Bundler.default_lockfile)
      ).specs.map(&:name)
    end

    def self.installed_gems
      `gem list --no-version`.split("\n")
    end

    def self.loaded_gems
      ::Gem.loaded_specs.keys
    end
  end
end

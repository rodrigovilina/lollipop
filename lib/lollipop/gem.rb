# typed: strict
# frozen_string_literal: true

module Lollipop
  module Gem
    include Kernel

    def initialize
      @installed = installed?
      @bundled = bundled?
      @loaded = loaded?
      @binstubed = binstubed?
    end

    def name
      raise NotImplementedError
    end

    def binstubs
      raise NotImplementedError
    end

    def installed?
      @installed ||= Environment.installed_gems.include? name
    end

    def bundled?
      @bundled ||= Environment.lockfile_gems.include? name
    end

    def loaded?
      @loaded ||= Environment.loaded_gems.include? name
    end

    def required?
      raise NotImplementedError, 'use: !!defined?(::Rubocop)'
    end

    def binstubed?
      @binstubed ||= binstubs.all? do |stub|
        File.exist?("bin/#{stub}")
      end
    end

    def install!
      if Lollipop::Environment.bundler?
        install_bundled
      else
        install_unbundled
      end
    end

    private

    def install_bundled
      raise NotImplementedError
    end

    def install_unbundled
      raise NotImplementedError
    end
  end
end

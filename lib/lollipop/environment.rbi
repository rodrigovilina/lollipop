# typed: strict
# frozen_string_literal: true

module Lollipop
  module Environment
    sig { returns T::Boolean }
    def self.rbenv?
    end

    sig { returns T::Boolean }
    def self.bundler?
    end

    sig { returns T::Array[String] }
    def self.lockfile_gems
    end

    sig { returns T::Array[T.nilable(String)] }
    def self.installed_gems
    end

    sig { returns T::Array[String] }
    def self.loaded_gems
    end
  end
end

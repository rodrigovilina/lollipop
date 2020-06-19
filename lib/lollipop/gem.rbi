# typed: strict
# frozen_string_literal: true

module Lollipop
  module Gem
    abstract!

    sig { void }
    def initialize
      @installed = T.let nil, T::Boolean
      @bundled = T.let nil, T::Boolean
      @loaded = T.let nil, T::Boolean
      @binstubed = T.let nil, T::Boolean
    end

    sig { abstract.returns String }
    def name
    end

    sig { abstract.returns T::Array[String] }
    def binstubs
    end

    sig { returns T::Boolean }
    def installed?
    end

    sig { returns T::Boolean }
    def bundled?
    end

    sig { returns T::Boolean }
    def loaded?
    end

    sig { returns T::Boolean }
    def required?
    end

    sig { returns T::Boolean }
    def binstubed?
    end

    sig { void }
    def install!
    end

    private

    sig { void }
    def install_bundled
    end

    sig { void }
    def install_unbundled
    end

    sig { returns T::Boolean }
    def all_binstubs?
    end
  end
end

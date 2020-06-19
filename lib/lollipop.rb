# typed: strict
# frozen_string_literal: true

require 'sorbet-runtime'
require 'byebug'
require 'lollipop/version'
require 'lollipop/gem'
require 'lollipop/environment'
require 'lollipop/gems/bundler_audit'
require 'lollipop/gems/rubocop'

module Lollipop
  class Error < StandardError
  end

  def self.install
    Gems::BundlerAudit.new.install!
    Gems::Rubocop.new.install!
  end
end

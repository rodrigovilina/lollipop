# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gem, '#required?' do
  let(:dummy_gem) do
    Class.new do
      include Lollipop::Gem

      def name
        'dummy'
      end

      def binstubs
        ['dummy']
      end
    end.new
  end

  it do
    expect { dummy_gem.required? }.to raise_error NotImplementedError
  end
end

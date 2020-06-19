# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gem, '#install!' do
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

  context 'when running through bundler' do
    it do
      allow(Lollipop::Environment).to receive(:bundler?).and_return(true)

      expect do
        dummy_gem.install!
      end.to raise_error NotImplementedError
    end
  end

  context 'when not running through bundler' do
    it do
      allow(Lollipop::Environment).to receive(:bundler?).and_return(false)

      expect do
        dummy_gem.install!
      end.to raise_error NotImplementedError
    end
  end
end

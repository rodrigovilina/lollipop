# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gem, '#bundled?' do
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

  context 'when bundled' do
    it 'is true' do
      allow(Lollipop::Environment).to receive(:lockfile_gems).and_return(
        ['dummy']
      )

      expect(dummy_gem.bundled?).to eq true
    end
  end

  context 'when not bundled' do
    it 'is false' do
      allow(Lollipop::Environment).to receive(:lockfile_gems).and_return([])

      expect(dummy_gem.bundled?).to eq false
    end
  end
end

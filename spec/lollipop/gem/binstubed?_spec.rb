# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gem, '#binstubed?' do
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

  context 'when all binstubs exists' do
    it do
      allow(File).to receive(:exist?).and_return(true)

      expect(dummy_gem.binstubed?).to eq true
    end
  end

  context 'when some binstub does not exist' do
    it do
      expect(dummy_gem.binstubed?).to eq false
    end
  end
end

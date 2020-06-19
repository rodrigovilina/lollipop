# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gem, '#initialize' do
  context 'when #name is not defined' do
    let(:dummy_gem) do
      Class.new do
        include Lollipop::Gem

        def binstubs
          ['dummy']
        end
      end
    end

    it do
      expect { dummy_gem.new }.to raise_error NotImplementedError
    end
  end

  context 'when #binstubs is not defined' do
    let(:dummy_gem) do
      Class.new do
        include Lollipop::Gem

        def name
          'dummy'
        end
      end
    end

    it do
      expect { dummy_gem.new }.to raise_error NotImplementedError
    end
  end

  context 'when both #name and #binstubs are defined' do
    let(:dummy_gem) do
      Class.new do
        include Lollipop::Gem

        def name
          'dummy'
        end

        def binstubs
          ['dummy']
        end
      end
    end

    it do
      expect { dummy_gem.new }.not_to raise_error
    end
  end
end

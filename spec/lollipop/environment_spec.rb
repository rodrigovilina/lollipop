# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Environment do
  describe '.rbenv?' do
    context 'when RBENV_VERSION is set' do
      it 'is true' do
        allow(ENV).to receive(:[]).with('RBENV_VERSION').and_return('2.7.1')

        expect(described_class.rbenv?).to eq true
      end
    end

    context 'when RBENV_VERSION is not set' do
      it 'is false' do
        allow(ENV).to receive(:[]).with('RBENV_VERSION').and_return(nil)

        expect(described_class.rbenv?).to eq false
      end
    end
  end

  describe '.bundler?' do
    context 'when BUNDLER_VERSION is set' do
      it 'is true' do
        allow(ENV).to receive(:[]).with('BUNDLER_VERSION').and_return('2.1.4')

        expect(described_class.bundler?).to eq true
      end
    end

    context 'when BUNDLER_VERSION is not set' do
      it 'is false' do
        allow(ENV).to receive(:[]).with('BUNDLER_VERSION').and_return(nil)

        expect(described_class.bundler?).to eq false
      end
    end
  end

  describe '.lockfile_gems' do
    it 'includes rubocop' do
      expect(described_class.lockfile_gems).to include 'rubocop'
    end
  end

  describe '.installed_gems' do
    it 'includes rubocop' do
      allow(described_class).to(
        receive(:`).and_return('dummy')
      )
      expect(described_class.installed_gems).to include 'dummy'
    end
  end

  describe '.loaded_gems' do
    it do
      expect(described_class.loaded_gems).to be_an Array
    end
  end
end

# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gems::Rubocop do
  describe '.bundled?' do
    context 'when rubocop is present in lockfile' do
      it 'is true' do
        expect(described_class.new.bundled?).to eq true
      end
    end

    context 'when rubocop is not present in lockfile' do
      it 'is false' do
        allow(Lollipop::Environment).to(
          receive(:lockfile_gems).and_return([])
        )

        expect(described_class.new.bundled?).to eq false
      end
    end
  end

  describe '.installed?' do
    context 'when installed' do
      it 'is true' do
        expect(described_class.new.installed?).to eq true
      end
    end

    context 'when not installed' do
      it 'is false' do
        allow(Lollipop::Environment).to(
          receive(:installed_gems).and_return([])
        )

        expect(described_class.new.installed?).to eq false
      end
    end
  end

  describe '.binstubed?' do
    context 'when binstub exists' do
      it 'is true' do
        expect(described_class.new.binstubed?).to eq true
      end
    end

    context 'when binstub does not exist' do
      it 'is false' do
        allow(File).to receive(:exist?).with('bin/rubocop').and_return(false)

        expect(described_class.new.binstubed?).to eq false
      end
    end
  end

  describe '.loaded?' do
    context 'when loaded' do
      it 'is true' do
        expect(described_class.new.loaded?).to eq true
      end
    end

    context 'when not loaded' do
      it 'is false' do
        allow(Lollipop::Environment).to receive(:loaded_gems).and_return([])

        expect(described_class.new.loaded?).to eq false
      end
    end
  end

  describe '.required?' do
    context 'when Rubocop is defined' do
      it 'is true' do
        stub_const('Rubocop', nil)

        expect(described_class.new.required?).to eq true
      end
    end

    context 'when Rubocop is undefined' do
      it 'is false' do
        expect(described_class.new.required?).to eq false
      end
    end
  end

  describe '#install' do
    context 'when bundled' do
      it 'bundles rubocop' do
        allow(described_class.new).to receive(:`).and_return(nil)
        described_class.new.install!

        expect(described_class.new.bundled?).to eq true
      end
    end

    context 'when not bundled' do
      it 'installs rubocop', aggregate_failures: true do
        allow(Lollipop::Environment).to receive(:bundler?).and_return false
        allow(described_class.new).to receive(:`).and_return(nil)

        described_class.new.install!
        expect(described_class.new.installed?).to eq true
      end
    end
  end
end

# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop::Gems::BundlerAudit do
  describe '.required?' do
    context 'when Bundler::Audit is defined' do
      it 'is true' do
        stub_const('Bundler::Audit', nil)

        expect(described_class.new.required?).to eq true
      end
    end

    context 'when Bunlder::Audit is undefined' do
      it 'is false' do
        expect(described_class.new.required?).to eq false
      end
    end
  end

  describe '#install' do
    context 'when bundled' do
      it 'bundles bunlder-audit' do
        allow(described_class.new).to receive(:`).and_return(nil)
        described_class.new.install!

        expect(described_class.new.bundled?).to eq true
      end
    end

    context 'when not bundled' do
      it 'installs bundler-audit', aggregate_failures: true do
        allow(Lollipop::Environment).to receive(:bundler?).and_return false
        allow(described_class.new).to receive(:`).and_return(nil)

        described_class.new.install!
        expect(described_class.new.installed?).to eq true
      end
    end
  end

  describe '#binstubs' do
    it 'returns bundle-audit and bundler-audit' do
      expect(described_class.new.binstubs).to match(
        %w[bundle-audit bundler-audit]
      )
    end
  end
end

# typed: false
# frozen_string_literal: true

RSpec.describe Lollipop do
  it 'has a version number' do
    expect(Lollipop::VERSION).not_to be nil
  end

  describe '.install' do
    let(:audit_instance) { instance_double(Lollipop::Gems::BundlerAudit) }
    let(:rubocop_instance) { instance_double(Lollipop::Gems::Rubocop) }

    before do
      allow(Lollipop::Gems::BundlerAudit).to(
        receive(:new).and_return(audit_instance)
      )
      allow(Lollipop::Gems::Rubocop).to(
        receive(:new).and_return(rubocop_instance)
      )
      allow(audit_instance).to receive(:install!)
      allow(rubocop_instance).to receive(:install!)
    end

    it aggregate_failures: true do
      described_class.install

      expect(audit_instance).to have_received(:install!)
      expect(rubocop_instance).to have_received(:install!)
    end
  end
end

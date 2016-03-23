require 'spec_helper'

describe BitBucket do
  let(:method) { 'create_repos'}
  let(:alt_method) { 'repos.create'}

  it { described_class.constants.should include :DEPRECATION_PREFIX }

  context '.deprecate' do
    before do
      BitBucket.deprecation_tracker = []
    end

    it 'tracks messages' do
      BitBucket.should_receive(:warn).once()
      BitBucket.deprecate(method)
      BitBucket.deprecate(method)
    end

    it 'prints the message through Kernel' do
      BitBucket.should_receive(:warn).once()
      BitBucket.deprecate method
    end
  end

  it 'prints the message through Kernel' do
    BitBucket.should_receive(:warn)
    BitBucket.warn_deprecation method
  end
end
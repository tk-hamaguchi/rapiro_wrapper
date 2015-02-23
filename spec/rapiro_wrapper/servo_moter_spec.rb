require 'spec_helper'

RSpec.describe RapiroWrapper::ServoMotor do
  before(:all) do
    DummyClass1 = Class.new(described_class) do
      NO = 0
      def initialize(_options = {})
        @value = 12
      end
    end
  end

  context 'constructor' do
    subject { described_class.new }
    it { expect { subject }.to raise_error NotImplementedError }
  end

  context 'extended class' do
    subject { Class.new(described_class) }
    it { is_expected.to respond_to :code }
    it { is_expected.to respond_to :find_servos }
  end
  context 'extended instance' do
    subject { Class.new(described_class).new }
    it { expect { subject }.to raise_error NotImplementedError }
    context 'that wrapped constructor' do
      subject { Class.new(described_class) { def initialize; end }.new }
      it { expect { subject }.to_not raise_error }
      it { is_expected.to respond_to :to_code }
    end
  end

  context '#to_code' do
    subject { DummyClass1.new.to_code }
    it { is_expected.to be_instance_of String }
    it { is_expected.to match(/^S\d{2}A\d{3}$/) }
    context 'for examples' do
      context 'set NO = 0 and @value = 12' do
        subject { DummyClass1.new.to_code }
        it { is_expected.to eq 'S00A012' }
      end
    end
  end

  context '.code' do
    subject { DummyClass1.code }
    it { is_expected.to be_instance_of String }
    it { is_expected.to match(/^S\d{2}A\d{3}$/) }
    context 'for examples' do
      context 'set NO = 0 and @value = 12' do
        subject { DummyClass1.code }
        it { is_expected.to eq 'S00A012' }
      end
    end
  end

  context '.find_servos' do
    subject { described_class.find_servos }
    it { is_expected.to be_instance_of Array }
    it 'should include subclasses' do
      is_expected.to include DummyClass1
    end
  end
end

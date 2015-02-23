require 'spec_helper'

RSpec.describe RapiroWrapper::Body do
  before(:all) do
    DummyClass = Class.new
  end
  let(:commander)     { double(RapiroWrapper::Commander) }
  let(:sequence)      { double }
  let(:serial_result) { double }
  let(:dummy_class)   { DummyClass }
  let(:dummy_motor)   { double(DummyClass) }
  before do
    allow(RapiroWrapper::Commander).to receive(:new) { commander }
    allow(commander).to receive(:sequences) { sequence }
    allow(commander).to receive(:write) { serial_result }
    allow(RapiroWrapper::ServoMotor).to receive(:find_servos) { [dummy_class] }
    allow(dummy_class).to receive(:new) { dummy_motor }
  end

  context 'constructor' do
    context 'instance variables' do
      context '@commander' do
        subject { super().instance_variable_get(:@commander) }
        it 'should be an instance of RapiroWrapper::Commander' do
          is_expected.to eq commander
        end
        after { subject }
      end
      context '@servos' do
        subject { super().instance_variable_get(:@servos) }
        it { is_expected.to be_instance_of Hash }
      end
    end
  end

  context '#sequences' do
    subject { super().sequences }
    it { is_expected.to eq sequence }
  end

  it 'should respond to dynamic setter' do
    is_expected.to respond_to :dummy_class=
  end

  context 'dynamic setter' do
    let(:motor) { double }
    subject { super().dummy_class = motor }
    it 'should eq argument for setter' do
      is_expected.to eq motor
    end
    it "call servo's sub class's constructor with args" do
      expect(dummy_class).to receive(:new).with(motor)
      subject
    end
    context 'then' do
      context '@dummy_class' do
        subject do
          sub = described_class.new
          sub.dummy_class = motor
          sub.instance_variable_get(:@dummy_class)
        end
        it { is_expected.to eq dummy_motor }
      end
    end
  end

  it 'should respond to dynamic getter' do
    is_expected.to respond_to :dummy_class
  end

  context 'dynamic getter' do
    subject { super().dummy_class }
    it "should be respond to instance of servo's sub class" do
      is_expected.to eq dummy_motor
    end
  end
end

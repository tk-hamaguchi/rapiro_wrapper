require 'spec_helper'

RSpec.describe RapiroWrapper::Commander do
  let(:serial_port) { double }
  before do
    allow(SerialPort).to receive_messages(new: serial_port)
  end
  context 'constructor' do
    it { expect { subject }.to_not raise_error }
    context '@serial' do
      subject { super().instance_variable_get(:@serial) }
      it { is_expected.to eq serial_port }
    end
    context 'without arguments, ' do
      context 'SerialPort' do
        it 'is called with "/dev/ttyAMA0" and 57600' do
          expect(SerialPort).to receive(:new).with('/dev/ttyAMA0', 57_600)
          subject
        end
      end
    end
    context 'with "/dev/tty.usbserial-DA00HMG6"' do
      context 'SerialPort' do
        it 'is called with "/dev/tty.usbserial-DA00HMG6" and 57600' do
          expect(SerialPort).to receive(:new).with('/dev/ttyAMA0', 57_600)
          subject
        end
      end
    end
  end
  context '#execute!' do
    context 'without arguments' do
      subject { super().execute! }
      it { expect { subject }.to raise_error ArgumentError }
    end
    context 'with [RapiroWrapper::Waist.new(left:10)] and 100,' do
      let(:commands) { [RapiroWrapper::Waist.new(left: 10)] }
      let(:duration) { 100 }
      let(:commander) do
        commander = described_class.new
        commander.instance_variable_set(:@serial, serial)
        commander
      end
      subject { commander.execute!(commands, duration) }
      let(:result) { double }
      let(:to_sequence_result) { double }
      let(:command) { double(to_sequence: to_sequence_result) }
      let(:serial) { double(write: result) }
      before do
        # allow(RapiroWrapper::Command).to receive_messages(new: command)
        allow(commander).to receive(:sequences) { to_sequence_result }
      end
      it 'should eq result for RapiroWrapper::Command.new([RapiroWrapper::' \
         'Waist.new(left:10)], 100).to_sequence()' do
        is_expected.to eq result
      end
      it '@serial#write is called with result for #sequences' do
        expect(serial).to receive(:write).with(to_sequence_result)
        subject
      end
      it '@serial#write is called with "#M0" when @serial is raised some ' \
         'errors' do
        allow(serial).to(
          receive(:write).with(to_sequence_result).and_raise(RuntimeError))
        expect(serial).to receive(:write).with('#M0')
        subject
      end
    end

    context 'with [RapiroWrapper::Head.new(left:10), RapiroWrapper::' \
            'Waist.new(left:10)],' do
      let(:commands) do
        [RapiroWrapper::Head.new(left: 10), RapiroWrapper::Waist.new(left: 10)]
      end
      subject do
        commander = super()
        commander.instance_variable_set(:@serial, serial)
        commander.execute!(commands)
      end
      let(:result) { double }
      let(:to_sequence_result) { double }
      let(:command) { double(to_sequence: to_sequence_result) }
      let(:serial) { double(write: result) }
      before do
        allow(RapiroWrapper::Command).to receive_messages(new: command)
      end
      it 'should eq result for RapiroWrapper::Command.new([RapiroWrapper::Hea' \
         'd.new(left:10), RapiroWrapper::Waist.new(left:10)]).to_sequence()' do
        is_expected.to eq result
      end
      it '@serial#write is called with result for @sequences' do
        expect(serial).to receive(:write).with(to_sequence_result)
        subject
      end
      it '@serial#write is called with "#M0" when @serial is raised some ' \
         'errors' do
        allow(serial).to(
          receive(:write).with(to_sequence_result).and_raise(RuntimeError))
        expect(serial).to receive(:write).with('#M0')
        subject
      end
      it '' do
        expect(RapiroWrapper::Command).to receive(:new).with(commands)
        subject
      end
    end
  end

  context '#sequences' do
  end
end

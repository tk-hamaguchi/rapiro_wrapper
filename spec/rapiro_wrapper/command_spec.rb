require 'spec_helper'

RSpec.describe RapiroWrapper::Command do
  context 'constructor' do
    context 'without arguments' do
      subject { described_class.new }
      it { expect { subject }.to_not raise_error }
      context '@sequences' do
        subject { super().instance_variable_get :@sequences }
        it { is_expected.to eq [] }
      end
    end
    context 'with args' do
      let(:args) { [double, double, double] }
      subject { described_class.new(args) }
      it { expect { subject }.to_not raise_error }
      context '@sequences' do
        subject { super().instance_variable_get :@sequences }
        it 'should eq args' do
          is_expected.to eq args
        end
      end
    end
  end
  context '#to_sequence' do
    context 'without args, with @sequences = []' do
      subject { described_class.new.to_sequence }
      it do
        is_expected.to eq '#PS00A090S01A090S02A000S03A130S04A090S05A180' \
             'S06A050S07A090S08A090S09A090S10A090S11A090R000G000B128T010'
      end
    end
    context 'without args, with @sequences = [RapiroWrapper::Head.new(left:' \
            '10), RapiroWrapper::Waist.new(left:10)]' do
      subject do
        described_class.new([
          RapiroWrapper::Head.new(left: 10),
          RapiroWrapper::Waist.new(left: 10)
        ]).to_sequence
      end
      it do
        is_expected.to eq '#PS00A100S01A100S02A000S03A130S04A090S05A180' \
             'S06A050S07A090S08A090S09A090S10A090S11A090R000G000B128T010'
      end
    end
    context 'with 128, with @sequences = []' do
      subject { described_class.new.to_sequence(128) }
      it do
        is_expected.to eq '#PS00A090S01A090S02A000S03A130S04A090S05A180' \
             'S06A050S07A090S08A090S09A090S10A090S11A090R000G000B128T128'
      end
    end
  end
end

require 'spec_helper'

RSpec.describe RapiroWrapper::LeftSholderPitch do
  context 'constants' do
    context 'NO' do
      subject { described_class.const_get(:NO) }
      it { is_expected.to eq 6 }
    end
    context 'DEFAULT' do
      subject { described_class.const_get(:DEFAULT) }
      it { is_expected.to eq 50 }
    end
    context 'MIN' do
      subject { described_class.const_get(:MIN) }
      it { is_expected.to eq 50 }
    end
    context 'MAX' do
      subject { described_class.const_get(:MAX) }
      it { is_expected.to eq 140 }
    end
  end

  context '.code' do
    context 'without arguments' do
      subject { described_class.code }
      it { is_expected.to eq 'S06A050' }
    end

    context 'with up' do
      subject { described_class.code(option) }

      context '-180' do
        let(:option) { { up: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { up: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { up: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { up: 0 } }
        it { is_expected.to eq 'S06A050' }
      end

      context '90' do
        let(:option) { { up: 90 } }
        it { is_expected.to eq 'S06A140' }
      end

      context '91' do
        let(:option) { { up: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { up: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end
  end

  context 'constructor' do
    context 'without arguments' do
      subject { described_class.new }
      it { expect { subject }.to_not raise_error }
      context '@value' do
        subject { described_class.new.instance_variable_get(:@value) }
        it { is_expected.to eq 50 }
      end
      context '#to_code' do
        subject { described_class.new.to_code }
        it { is_expected.to eq 'S06A050' }
      end
    end

    context 'with up' do
      subject { described_class.new(option).instance_variable_get(:@value) }

      context '-180' do
        let(:option) { { up: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { up: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { up: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { up: 0 } }
        context '@value' do
          it { is_expected.to eq 50 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S06A050' }
        end
      end

      context '90' do
        let(:option) { { up: 90 } }
        context '@value' do
          it { is_expected.to eq 140 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S06A140' }
        end
      end

      context '91' do
        let(:option) { { up: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { up: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end
  end
end

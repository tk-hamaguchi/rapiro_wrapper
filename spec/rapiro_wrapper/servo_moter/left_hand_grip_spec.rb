require 'spec_helper'

RSpec.describe RapiroWrapper::LeftHandGrip do
  context 'constants' do
    context 'NO' do
      subject { described_class.const_get(:NO) }
      it { is_expected.to eq 7 }
    end
    context 'DEFAULT' do
      subject { described_class.const_get(:DEFAULT) }
      it { is_expected.to eq 90 }
    end
    context 'MIN' do
      subject { described_class.const_get(:MIN) }
      it { is_expected.to eq 60 }
    end
    context 'MAX' do
      subject { described_class.const_get(:MAX) }
      it { is_expected.to eq 110 }
    end
  end

  context '.code' do
    context 'without arguments' do
      subject { described_class.code }
      it { is_expected.to eq 'S07A090' }
    end

    context 'with both open and hold' do
      subject { described_class.code(option) }
      let(:option) { { open: 0, hold: 0 } }
      it { expect { subject }.to raise_error ArgumentError }
    end

    context 'with open' do
      subject { described_class.code(option) }

      context '-180' do
        let(:option) { { open: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { open: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { open: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { open: 0 } }
        it { is_expected.to eq 'S07A060' }
      end

      context '50' do
        let(:option) { { open: 50 } }
        it { is_expected.to eq 'S07A110' }
      end

      context '51' do
        let(:option) { { open: 51 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '90' do
        let(:option) { { open: 90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { open: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end

    context 'with hold' do
      subject { described_class.code(option) }

      context '-180' do
        let(:option) { { hold: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { hold: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { hold: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { hold: 0 } }
        it { is_expected.to eq 'S07A110' }
      end

      context '50' do
        let(:option) { { hold: 50 } }
        it { is_expected.to eq 'S07A060' }
      end

      context '51' do
        let(:option) { { hold: 51 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '90' do
        let(:option) { { hold: 90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { hold: 180 } }
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
        it { is_expected.to eq 90 }
      end
      context '#to_code' do
        subject { described_class.new.to_code }
        it { is_expected.to eq 'S07A090' }
      end
    end

    context 'with both open and hold' do
      subject { described_class.new(option).instance_variable_get(:@value) }
      let(:option) { { open: 0, hold: 0 } }
      it { expect { subject }.to raise_error ArgumentError }
    end

    context 'with open' do
      subject { described_class.new(option).instance_variable_get(:@value) }

      context '-180' do
        let(:option) { { open: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { open: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { open: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { open: 0 } }
        context '@value' do
          it { is_expected.to eq 60 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S07A060' }
        end
      end

      context '50' do
        let(:option) { { open: 50 } }
        context '@value' do
          it { is_expected.to eq 110 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S07A110' }
        end
      end

      context '51' do
        let(:option) { { open: 51 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '90' do
        let(:option) { { open: 90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { open: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end

    context 'with hold' do
      subject { described_class.new(option).instance_variable_get(:@value) }

      context '-180' do
        let(:option) { { hold: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { hold: -90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-1' do
        let(:option) { { hold: -1 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '0' do
        let(:option) { { hold: 0 } }
        context '@value' do
          it { is_expected.to eq 110 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S07A110' }
        end
      end

      context '50' do
        let(:option) { { hold: 50 } }
        context '@value' do
          it { is_expected.to eq 60 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S07A060' }
        end
      end

      context '51' do
        let(:option) { { hold: 51 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '90' do
        let(:option) { { hold: 90 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { hold: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end
  end
end

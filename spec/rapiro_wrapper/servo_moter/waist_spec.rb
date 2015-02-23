require 'spec_helper'

RSpec.describe RapiroWrapper::Waist do
  context 'constants' do
    context 'NO' do
      subject { described_class.const_get(:NO) }
      it { is_expected.to eq 1 }
    end
    context 'DEFAULT' do
      subject { described_class.const_get(:DEFAULT) }
      it { is_expected.to eq 90 }
    end
    context 'MIN' do
      subject { described_class.const_get(:MIN) }
      it { is_expected.to eq 0 }
    end
    context 'MAX' do
      subject { described_class.const_get(:MAX) }
      it { is_expected.to eq 180 }
    end
  end

  context '.code' do
    context 'without arguments' do
      subject { described_class.code }
      it { is_expected.to eq 'S01A090' }
    end

    context 'with both right and left' do
      subject { described_class.code(option) }
      let(:option) { { right: 0, left: 0 } }
      it { expect { subject }.to raise_error ArgumentError }
    end

    context 'with right' do
      subject { described_class.code(option) }

      context '-180' do
        let(:option) { { right: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-91' do
        let(:option) { { right: -91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { right: -90 } }
        it { is_expected.to eq 'S01A180' }
      end

      context '0' do
        let(:option) { { right: 0 } }
        it { is_expected.to eq 'S01A090' }
      end

      context '90' do
        let(:option) { { right: 90 } }
        it { is_expected.to eq 'S01A000' }
      end

      context '91' do
        let(:option) { { right: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { right: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end

    context 'with left' do
      subject { described_class.code(option) }

      context '-180' do
        let(:option) { { left: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-91' do
        let(:option) { { left: -91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { left: -90 } }
        it { is_expected.to eq 'S01A000' }
      end

      context '0' do
        let(:option) { { left: 0 } }
        it { is_expected.to eq 'S01A090' }
      end

      context '90' do
        let(:option) { { left: 90 } }
        it { is_expected.to eq 'S01A180' }
      end

      context '91' do
        let(:option) { { left: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { left: 180 } }
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
        it { is_expected.to eq 'S01A090' }
      end
    end

    context 'with both right and left' do
      subject { described_class.new(option).instance_variable_get(:@value) }
      let(:option) { { right: 0, left: 0 } }
      it { expect { subject }.to raise_error ArgumentError }
    end

    context 'with right' do
      subject { described_class.new(option).instance_variable_get(:@value) }

      context '-180' do
        let(:option) { { right: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-91' do
        let(:option) { { right: -91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { right: -90 } }
        context '@value' do
          it { is_expected.to eq 180 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A180' }
        end
      end

      context '0' do
        let(:option) { { right: 0 } }
        context '@value' do
          it { is_expected.to eq 90 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A090' }
        end
      end

      context '90' do
        let(:option) { { right: 90 } }
        context '@value' do
          it { is_expected.to eq 0 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A000' }
        end
      end

      context '91' do
        let(:option) { { right: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { right: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end

    context 'with left' do
      subject { described_class.new(option).instance_variable_get(:@value) }

      context '-180' do
        let(:option) { { left: -180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-91' do
        let(:option) { { left: -91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '-90' do
        let(:option) { { left: -90 } }
        context '@value' do
          it { is_expected.to eq 0 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A000' }
        end
      end

      context '0' do
        let(:option) { { left: 0 } }
        context '@value' do
          it { is_expected.to eq 90 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A090' }
        end
      end

      context '90' do
        let(:option) { { left: 90 } }
        context '@value' do
          it { is_expected.to eq 180 }
        end
        context '#to_code' do
          subject { described_class.new(option).to_code }
          it { is_expected.to eq 'S01A180' }
        end
      end

      context '91' do
        let(:option) { { left: 91 } }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context '180' do
        let(:option) { { left: 180 } }
        it { expect { subject }.to raise_error ArgumentError }
      end
    end
  end
end

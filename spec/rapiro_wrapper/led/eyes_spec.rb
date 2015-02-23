require 'spec_helper'

RSpec.describe RapiroWrapper::Eyes do
  context 'constructor' do
    context 'without params' do
      context '@value' do
        subject { described_class.new.instance_variable_get :@value }
        it { is_expected.to eq '#000080' }
      end
    end
    context 'with "#123456"' do
      context '@value' do
        subject { described_class.new('#123456').instance_variable_get :@value }
        it { is_expected.to eq '#123456' }
      end
    end
    context 'with { red: 255, green: 128, blue: 0 }' do
      context '@value' do
        subject do
          described_class.new(red: 255, green: 128, blue: 0)
            .instance_variable_get :@value
        end
        it { is_expected.to eq '#ff8000' }
      end
    end
  end

  context '#to_code' do
    context 'with @value = "#ff8000"' do
      subject { described_class.new('#ff8000').to_code }
      it { is_expected.to eq 'R255G128B000' }
    end
    context 'with @value = "#aabbcc"' do
      subject { described_class.new('#aabbcc').to_code }
      it { is_expected.to eq 'R170G187B204' }
    end
  end
end

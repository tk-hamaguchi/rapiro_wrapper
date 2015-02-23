require 'spec_helper'

RSpec.describe RapiroWrapper do
  subject { described_class }
  context 'constants' do
    context 'VERSION' do
      subject { described_class.const_get(:VERSION) }
      it { is_expected.to eq '0.1.0' }
    end
  end
end

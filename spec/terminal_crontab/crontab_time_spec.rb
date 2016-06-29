require 'spec_helper'

describe TerminalCrontab::CrontabTime do
  subject { described_class.new(value) }

  describe '#valid?' do
    context 'true' do
      context 'for allowed_values' do
        let(:value) { '50' }
        it { expect(subject.valid?).to be_truthy }
      end

      context 'for list' do
        let(:value) { '1,10' }
        it { expect(subject.valid?).to be_truthy }
      end

      context 'for range' do
        let(:value) { '1-10' }
        it { expect(subject.valid?).to be_truthy }
      end

      context 'for step' do
        let(:value) { '1/15' }
        it { expect(subject.valid?).to be_truthy }
      end
    end

    context 'false' do
      context 'for allowed_values' do
        let(:value) { '150' }
        it { expect(subject.valid?).to be_falsey }
      end

      context 'for list' do
        let(:value) { '1,70' }
        it { expect(subject.valid?).to be_falsey }
      end

      context 'for range' do
        let(:value) { '90-10' }
        it { expect(subject.valid?).to be_falsey }
      end

      context 'for step' do
        let(:value) { '1/65' }
        it { expect(subject.valid?).to be_falsey }
      end
    end
  end

  describe '#allowed_values?' do
    context 'true' do
      let(:value) { '5' }
      it { expect(subject.allowed_values?).to be_truthy }
    end

    context 'false' do
      let(:value) { '125' }
      it { expect(subject.allowed_values?).to be_falsey }
    end
  end

  describe '#list?' do
    context 'true' do
      let(:value) { '15,20,45' }
      it { expect(subject.list?).to be_truthy }
    end

    context 'false' do
      let(:value) { '10' }
      it { expect(subject.list?).to be_falsey }
    end
  end

  describe '#range?' do
    context 'true' do
      let(:value) { '10-40' }
      it { expect(subject.range?).to be_truthy }
    end

    context 'false' do
      let(:value) { '5,10' }
      it { expect(subject.range?).to be_falsey }
    end
  end

  describe '#step?' do
    context 'true' do
      let(:value) { '0/10' }
      it { expect(subject.step?).to be_truthy }
    end

    context 'false' do
      let(:value) { '10-40' }
      it { expect(subject.step?).to be_falsey }
    end
  end
end

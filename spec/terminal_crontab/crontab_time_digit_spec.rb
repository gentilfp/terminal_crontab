require 'spec_helper'

describe TerminalCrontab::CrontabTimeDigit do
  describe '#self.format' do
    context '*st' do
      it { expect(described_class.format(1)).to eq "1st" }
      it { expect(described_class.format(21)).to eq "21st" }
    end

    context '*nd' do
      it { expect(described_class.format(2)).to eq "2nd" }
      it { expect(described_class.format(22)).to eq "22nd" }
    end

    context '*rd' do
      it { expect(described_class.format(3)).to eq "3rd" }
      it { expect(described_class.format(23)).to eq "23rd" }
    end

    context '*th' do
      it { expect(described_class.format(11)).to eq "11th" }
      it { expect(described_class.format(12)).to eq "12th" }
      it { expect(described_class.format(13)).to eq "13th" }
      it { expect(described_class.format(5)).to eq "5th" }
    end
  end

end

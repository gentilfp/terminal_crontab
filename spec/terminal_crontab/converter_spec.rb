require 'spec_helper'

describe TerminalCrontab::Converter do
  describe '.to_human' do
    it { expect(described_class.to_human).to eq 'at every minute every day' }
  end

  describe '.to_crontab' do
    it { expect(described_class.to_crontab).to eq '* * * * *' }
  end
end

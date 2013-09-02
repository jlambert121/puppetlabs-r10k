require 'spec_helper'

describe 'r10k::config', :type => :class do
  let(:facts) { { :lsbdistcodename => 'squeeze' } }

  it { should create_class('r10k::config') }
  it { should contain_file('/etc/r10k.yaml') }
  it { should contain_cron('r10k full synchronization').with_ensure('present')}

  context 'no cron' do
    let(:params) { { :cron_entry => false } }
    it { should contain_cron('r10k full synchronization').with_ensure('absent')}
  end

end

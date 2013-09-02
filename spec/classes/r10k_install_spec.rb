require 'spec_helper'

describe 'r10k::install', :type => :class do
  let(:facts) { { :lsbdistcodename => 'squeeze' } }

  it { should create_class('r10k::install') }
  it { should contain_package('r10k') }

end

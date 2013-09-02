require 'spec_helper'

describe 'r10k', :type => :class do
  let(:facts) { { :operatingsystem => 'Redhat' } }

  it { should create_class('r10k') }

end

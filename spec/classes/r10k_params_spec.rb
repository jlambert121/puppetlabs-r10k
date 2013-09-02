require 'spec_helper'

describe 'r10k::params', :type => :class do

  [ 'Ubuntu', 'Debian' ].each do |distro|
    ['squeeze', 'precise', 'lucid' ].each do |release|
      context "#{distro} pass" do
        let(:facts) { { :operatingsystem => distro, :lsbdistcodename => release } }

        # Nothing to really test here, other than making sure there aren't any errors
      end
    end

    context 'unknown debian/ubuntu based' do
      let(:facts) { { :operatingsystem => distro, :lsbdistcodename => 'unreleased' } }
      it { expect { should raise_error(Puppet::Error) } }
    end
  end

  ['CentOS', 'Redhat', 'Fedora', 'Scientific', 'Amazon'].each do |distro|
    context "#{distro} pass" do
      let(:facts) { { :operatingsystem => distro } }

      # Nothing to really test here, other than making sure there aren't any errors
    end
  end

  context 'unknown os' do
    it { expect { should raise_error(Puppet::Error) } }
  end

end

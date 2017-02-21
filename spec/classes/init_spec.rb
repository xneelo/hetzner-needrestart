require 'spec_helper'
describe 'needrestart' do
  context 'with default values for all parameters on Debian' do
    let(:facts) { { :operatingsystem => 'Debian' } }
    it { should contain_class('needrestart') }
  end

  context 'with default values for all parameters on Ubuntu 16.04' do
    let(:facts) { { :operatingsystem => 'Ubuntu', :lsbdistrelease => '16.04'  } }
    it { should contain_class('needrestart') }
  end
end

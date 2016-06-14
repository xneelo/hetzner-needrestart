require 'spec_helper'
describe 'needrestart' do
  context 'with default values for all parameters' do
    it { should contain_class('needrestart') }
  end
end

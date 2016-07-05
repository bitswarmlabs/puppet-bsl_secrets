require 'spec_helper'
describe 'bsl_secrets' do

  context 'with default values for all parameters' do
    it { should contain_class('bsl_secrets') }
  end
end

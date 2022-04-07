require 'spec_helper_acceptance'

describe 'apply aide' do
  let(:pp) do
    <<-MANIFEST
      include aide
      include aide::cron
      include aide::config
      include aide::firstrun 
    MANIFEST
  end

  it 'applies idempotently' do
    idempotent_apply(pp)
  end

  describe 'aide' do
    it { is_expected.to contain_class('aide')
    it { is_expected.to contain_class('aide::cron')
    it { is_expected.to contain_class('aide::config') 
    it { is_expected.to contain_class('aide::firstrun')
  end

  describe package('aide') do
    it { should be_installed }
  end
end

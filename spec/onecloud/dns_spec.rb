require 'spec_helper'

describe Onecloud::DNS do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :post
    @api.stub :delete
  end

  describe '#DNS' do
    describe 'list all domains' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('Dns')
        @api.domains
      end
    end

    describe 'get domain by ID' do
      it 'calls #get with the correct url' do
        id = 12345
        @api.should_receive(:get).with("Dns/#{id}")
        @api.domain_by_id id
      end
    end

    describe 'create new domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns', params)
        @api.add_domain params
      end
    end

    describe 'remove domain by ID' do
      it 'calls #delete with the correct url' do
        id = 12345
        @api.should_receive(:delete).with("dns/#{id}")
        @api.remove_domain id
      end
    end

    describe 'create A type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recorda', params)
        @api.add_domain_record_A params
      end
    end

    describe 'create AAAA type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordaaaa', params)
        @api.add_domain_record_AAAA params
      end
    end

    describe 'create CNAME type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordcname', params)
        @api.add_domain_record_CNAME params
      end
    end

    describe 'create MX type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordmx', params)
        @api.add_domain_record_MX params
      end
    end

    describe 'create NS type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordns', params)
        @api.add_domain_record_NS params
      end
    end

    describe 'create TXT type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordtxt', params)
        @api.add_domain_record_TXT params
      end
    end

    describe 'create SRV type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordsrv', params)
        @api.add_domain_record_SRV params
      end
    end

    describe 'remove record for domain with ID' do
      it 'calls #delete with the correct url' do
        domain_id = 12345
        record_id = 54321
        @api.should_receive(:delete).with("dns/#{domain_id}/#{record_id}")
        @api.remove_domain_record(domain_id, record_id)
      end
    end

  end
end

# frozen_string_literal: true

require 'spec_helper'

describe Onecloud::DNS do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :post
    @api.stub :delete
  end

  describe '#DNS' do
    context 'list all domains' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('Dns')
        @api.domains
      end
    end

    context 'get domain by ID' do
      it 'calls #get with the correct url' do
        id = 123
        @api.should_receive(:get).with("Dns/#{id}")
        @api.domain_by_id id
      end
    end

    context 'create new domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns', params)
        @api.add_domain params
      end
    end

    context 'remove domain by ID' do
      it 'calls #delete with the correct url' do
        id = 123
        @api.should_receive(:delete).with("dns/#{id}")
        @api.remove_domain id
      end
    end

    context 'create A type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recorda', params)
        @api.add_domain_record_a params
      end
    end

    context 'create AAAA type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordaaaa', params)
        @api.add_domain_record_aaaa params
      end
    end

    describe 'create CNAME type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordcname', params)
        @api.add_domain_record_cname params
      end
    end

    describe 'create MX type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordmx', params)
        @api.add_domain_record_mx params
      end
    end

    describe 'create NS type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordns', params)
        @api.add_domain_record_ns params
      end
    end

    describe 'create TXT type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordtxt', params)
        @api.add_domain_record_txt params
      end
    end

    describe 'create SRV type record for domain' do
      it 'calls #post with the correct url' do
        params = { name: :new_domain }
        @api.should_receive(:post).with('dns/recordsrv', params)
        @api.add_domain_record_srv params
      end
    end

    describe 'remove record for domain with ID' do
      it 'calls #delete with the correct url' do
        domain_id = 123
        record_id = 543
        @api.should_receive(:delete).with("dns/#{domain_id}/#{record_id}")
        @api.remove_domain_record(domain_id, record_id)
      end
    end
  end
end

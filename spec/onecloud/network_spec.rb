require 'spec_helper'

describe Onecloud::Network do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :post
    @api.stub :delete
  end

  describe '#network' do
    describe 'list all networks' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('network')
        @api.networks
      end
    end

    describe 'private network by ID' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('network')
        @api.networks
      end
    end

    describe 'create network by ID' do
      it 'calls #get with the correct url' do
      params = { name: :new_network } 
        @api.should_receive(:post).with('network', params)
        @api.add_network params
      end
    end

    describe 'remove network by ID' do
      it 'calls #delete with the correct url' do
        id = 12345
        @api.should_receive(:delete).with("network/#{id}")
        @api.remove_network id
      end
    end

  end
end

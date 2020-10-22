# frozen_string_literal: true

require 'spec_helper'

describe Onecloud::Server do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :put
    @api.stub :post
    @api.stub :delete
  end

  describe '#server' do
    context 'list all servers' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('Server')
        @api.servers
      end
    end

    context 'get server by ID' do
      it 'calls #get with the correct url' do
        id = 123
        @api.should_receive(:get).with("Server/#{id}")
        @api.server_by_id id
      end
    end

    context 'create server' do
      it 'calls #post with the correct url' do
        params = { name: :new_server }
        @api.should_receive(:post).with('Server', params)
        @api.add_server params
      end
    end

    context 'update server by ID' do
      it 'calls #put with the correct url' do
        server_id = 123
        params = { name: :new_server }
        @api.should_receive(:put).with("Server/#{server_id}", params)
        @api.update_server_by_id(server_id, params)
      end
    end

    context 'remove server by ID' do
      it 'calls #delete with the correct url' do
        id = 123
        @api.should_receive(:delete).with("Server/#{id}")
        @api.remove_server id
      end
    end

    describe 'do server action by ID' do
      it 'calls #post with the correct url' do
        server_id = 123
        params = { name: :new_server }
        @api.should_receive(:post).with("Server/#{server_id}/Action", params)
        @api.server_do_action(server_id, params)
      end
    end

    describe 'get server actions by server ID' do
      it 'calls #get with the correct url' do
        server_id = 123
        @api.should_receive(:get).with("Server/#{server_id}/Action")
        @api.server_actions server_id
      end
    end

    describe 'apply server action' do
      it 'calls #get with the correct url' do
        server_id = 123
        action_id = 543
        @api.should_receive(:get).with("Server/#{server_id}/Action/#{action_id}")
        @api.server_apply_action(server_id, action_id)
      end
    end

    describe 'rebuild server action' do
      it 'calls #post with the correct url' do
        server_id = 123
        params = { IsNeedSysprep: true }
        @api.should_receive(:post).with("Server/#{server_id}/rebuild", params)
        @api.server_rebuild(server_id, params)
      end
    end
  end
end

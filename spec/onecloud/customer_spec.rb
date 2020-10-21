# frozen_string_literal: true

require 'spec_helper'

describe Onecloud::Customer do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
  end

  context '#balance' do
    it 'calls #get with the correct url' do
      @api.should_receive(:get).with('customer/balance')
      @api.balance
    end
  end
end

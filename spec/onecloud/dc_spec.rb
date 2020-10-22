# frozen_string_literal: true

require 'spec_helper'

describe Onecloud::DC do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
  end

  describe '#dcLocation' do
    it 'calls #get with the correct url' do
      @api.should_receive(:get).with('dcLocation')
      @api.datacenters
    end
  end
end

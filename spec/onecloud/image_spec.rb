# frozen_string_literal: true

require 'spec_helper'

describe Onecloud::Image do
  before(:each) do
    @api = Onecloud::Api.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :post
    @api.stub :delete
  end

  describe '#image' do
    context 'list all images' do
      it 'calls #get with the correct url' do
        @api.should_receive(:get).with('Image')
        @api.images
      end
    end

    context 'add new image' do
      it 'calls #post with the correct url' do
        params = { name: :new_image }
        @api.should_receive(:post).with('image', params)
        @api.add_image params
      end
    end

    context 'remove image' do
      it 'calls #delete with the correct url' do
        id = 123
        @api.should_receive(:delete).with("image/#{id}")
        @api.remove_image id
      end
    end
  end
end

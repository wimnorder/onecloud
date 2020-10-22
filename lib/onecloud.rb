# frozen_string_literal: true

require 'net/http'
require 'openssl'
require 'json'
require 'uri'

require 'onecloud/customer'
require 'onecloud/dc'
require 'onecloud/dns'
require 'onecloud/errors'
require 'onecloud/image'
require 'onecloud/network'
require 'onecloud/server'
require 'onecloud/request'
require 'onecloud/version'

# Onecloud API Gem
module Onecloud
  # Onecloud API Authorize
  # Params:
  # +token+:: Client access token
  class Api
    include Request
    include Customer
    include DC
    include DNS # TODO: Rename to Domains
    include Image
    include Network
    include Server
    include Errors

    API_ENDPOINT = 'https://api.1cloud.ru/'

    HTTP_METHODS = {
      get: Net::HTTP::Get,
      put: Net::HTTP::Put,
      post: Net::HTTP::Post,
      delete: Net::HTTP::Delete
    }.freeze

    def initialize(token)
      @token = token
      uri = URI.parse(API_ENDPOINT)

      @http = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
      @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      @http.ssl_version = :TLSv1_2
    end

    private

    def json_request(meth, path, params = {})
      response = request(meth, path, params)

      result = Struct.new(:code, :status, :body)

      if !response.body.empty? # DELETE requests has empty body
        json_body = JSON.parse(response.body, quirks_mode: true)
        result.new(response.code, RESPONSE_CODES[response.code.to_s.to_sym], json_body)
      else
        result.new(response.code, nil)
      end
    end

    def request(meth, path, params = {})
      full_path = encode_path_params([API_ENDPOINT, path].join, params)

      request = HTTP_METHODS[meth.to_sym].new(full_path)

      request['Content-Type'] = 'application/json'
      request['Authorization'] = ['Bearer ', @token].join

      if %w[post put].include?(meth.to_s)
        request.body = params.to_json
        return @http.request(request)
      end
      @http.request(request)
    end

    def encode_path_params(path, params)
      [path, URI.encode_www_form(params)].join('?')
    end
  end
end

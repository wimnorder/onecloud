
module Onecloud
  # Requests data from API
  module Request
    def get(path, params = {})
      json_request :get, path, params
    end

    def put(path, params = {})
      json_request :put, path, params
    end

    def post(path, params = {})
      json_request :post, path, params
    end

    def patch(path, params = {})
      json_request :patch, path, params
    end

    def delete(path)
      json_request :delete, path
    end
  end
end

module Onecloud
  # API response codes
  module Errors
    RESPONSE_CODES = {
      "200": 'Request successfully complete',
      "401": 'Request is not authorized',
      "403": 'Forbidden',
      "404": 'Object not found',
      "400": 'Bad request parameters',
      "500": 'Unknown error has occurred - contact 1Cloud.ru support'
    }
  end
end

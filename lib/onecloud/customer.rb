module Onecloud
  # Get current balance
  module Customer
    def balance
      get('customer/balance')
    end
  end
end

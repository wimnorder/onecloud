module Onecloud
  # Private networks
  module Network
    # List of all networks
    def networks
      get('network')
    end

    # Private network by ID
    def network_by_id(id)
      get("network/#{id}")
    end

    # Create new network with params
    def add_network(params)
      post('network', params)
    end

    # Remove network by ID
    def remove_network(id)
      delete("network/#{id}")
    end
  end
end

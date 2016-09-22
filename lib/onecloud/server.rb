module Onecloud
  # Server methods
  module Server
    # List of all servers
    def servers
      get('Server')
    end

    # Get server by ID
    def server_by_id(server_id)
      get("Server/#{server_id}")
    end

    # Create new server
    def add_server(params)
      post('Server', params)
    end

    # Update server configuration
    def update_server_by_id(server_id, params)
      put("Server/#{server_id}", params)
    end

    # Remove server by ID
    def remove_server(server_id)
      delete("Server/#{server_id}")
    end

    # System actions with server by ID
    # TODO: separate actions by name (eg. server_reload(id), server_poweroff)
    def server_do_action(server_id, params)
      post("Server/#{server_id}/Action", params)
    end

    # All previous actions on the server
    def server_actions(server_id)
      get("Server/#{server_id}/Action")
    end

    # The action on the server
    def server_apply_action(server_id, action_id)
      get("Server/#{server_id}/Action/#{action_id}")
    end

    # Rebuild server
    def server_rebuild(server_id, params)
      post("Server/#{server_id}/rebuild", params)
    end
  end
end

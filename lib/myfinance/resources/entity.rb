module Myfinance
  module Resources
    #
    # A wrapper to Myfinance entities API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/entities
    #
    class Entity < Base
      #
      # List all entities of the user
      #
      # [API]
      #   Method: <tt>GET /entities</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_index
      #
      def find_all
        http.get('/entities', body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific entity
      #
      # [API]
      #   Method: <tt>GET /entities/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_show
      #
      def find(entity_id)
        http.get("/entities/#{entity_id}", body: {}) do |response|
          respond_with_object(response, 'entity')
        end
      end

      #
      # Return attributes from entity
      #
      # [API]
      #   Method: <tt>GET /entities/new</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_new
      #
      def get_new
        http.get("/entities/new", body: {}) do |response|
          respond_with_object(response, 'entity')
        end
      end

      #
      # Create a specific entity
      #
      # [API]
      #   Method: <tt>POST /entities</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#post_create
      #
      def create(params)
        http.post("/entities", body: params) do |response|
          respond_with_object(response, 'entity')
        end
      end

      #
      # Update a specific entity
      #
      # [API]
      #   Method: <tt>PUT /entities/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#put_update
      #
      def update(entity_id, params)
        http.put("/entities/#{entity_id}", body: params) do |response|
          respond_with_object(response, 'entity')
        end
      end
    end
  end
end

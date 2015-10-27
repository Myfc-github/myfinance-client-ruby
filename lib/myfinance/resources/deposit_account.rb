module Myfinance
  module Resources
    class DepositAccount < Base
      #
      # List all deposit_accounts of the user
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#get_index
      #
      def find_all(entity_id)
        http.get("/entities/#{entity_id}/deposit_accounts", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific deposit_account
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#get_show
      #
      def find(entity_id, id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{id}", body: {}) do |response|
          respond_with_object(response, 'deposit_account')
        end
      end

      #
      # Create a specific deposit_account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/deposit_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#post_create
      #
      def create(entity_id, params)
        http.post("/entities/#{entity_id}/deposit_accounts", body: params) do |response|
          respond_with_object(response, 'deposit_account')
        end
      end

      #
      # Update a specific deposit_account
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#put_update
      #
      def update(entity_id, id, params)
        http.put("/entities/#{entity_id}/deposit_accounts/#{id}", body: params) do |response|
          respond_with_object(response, 'deposit_account')
        end
      end

      #
      # Delete a specific deposit_account
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/deposit_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/deposit_accounts#delete_destroy
      #
      def destroy(entity_id, id)
        http.delete("/entities/#{entity_id}/deposit_accounts/#{id}", body: {}) do |response|
          response.code
        end
      end
    end
  end
end

module Myfinance
  module Resources
    class FinancialTransaction < Base
      #
      # List all financial_transactions of the user
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#get_index
      #
      def find_all(entity_id, deposit_account_id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific financial_transaction
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#get_show
      #
      def find(entity_id, deposit_account_id, id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions/#{id}", body: {}) do |response|
          respond_with_object(response, 'financial_transaction')
        end
      end

      #
      # Generate a empty object from financial_transaction
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/new</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#get_new
      #
      def get_new(entity_id, deposit_account_id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions/new", body: {}) do |response|
          respond_with_object(response, 'financial_transaction')
        end
      end

      #
      # Create a specific financial_transaction
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#post_create
      #
      def create(entity_id, deposit_account_id, params)
        http.post("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions", body: params) do |response|
          respond_with_object(response, 'financial_transaction')
        end
      end

      #
      # Update a specific financial_transaction
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#put_update
      #
      def update(entity_id, deposit_account_id, id, params)
        http.put("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions/#{id}", body: params) do |response|
          respond_with_object(response, 'financial_transaction')
        end
      end

      #
      # Delete a specific financial_transaction
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#delete_destroy
      #
      def destroy(entity_id, deposit_account_id, id)
        http.delete("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions/#{id}", body: {}) do |response|
          response.code
        end
      end

      #
      # Destroy many financial_transaction
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/destroy_many?selected_ids=:id1,id2,id3</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#delete_destroy_many
      #
      def destroy_many(entity_id, deposit_account_id, params)
        http.delete("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions/destroy_many", body: params) do |response|
          true
        end
      end
    end
  end
end

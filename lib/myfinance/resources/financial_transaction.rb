module Myfinance
  module Resources
    class FinancialTransaction < Base
      #
      # A wrapper to Myfinance financial transaction API
      #
      # [API]
      #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions
      #
      def find_all(entity_id, deposit_account_id)
        #
        # List all financial transactions
        #
        # [API]
        #   Method: <tt>GET entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#get_index
        #
        http.get(path(entity_id, deposit_account_id), body: {}) do |response|
          respond_with_collection(response)
        end       
      end

      def find(entity_id, deposit_account_id, id)
        #
        # Show a financial transaction
        #
        # [API]
        #   Method: <tt>GET entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#get_show
        #
        ft_path = path(entity_id, deposit_account_id) + "/#{id}"
        http.get(ft_path, body: {}) do |response|
          respond_with_object(response, "financial_transaction")
        end
      end

      def create(entity_id, deposit_account_id, params = {})
        #
        # Create a financial transaction
        #
        # [API]
        #   Method: <tt>POST entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#post_create
        #
        body = { financial_transaction: params }
        http.post(path(entity_id, deposit_account_id), { body: body }) do |response|
          respond_with_object(response, "financial_transaction")
        end
      end

      def update(entity_id, deposit_account_id, id, params = {})
        # Update a financial transaction
        #
        # [API]
        #   Method: <tt>PUT entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#put_update
        #
        ft_path = path(entity_id, deposit_account_id) + "/#{id}"
        body = { financial_transaction: params }
        http.put(ft_path, { body: body }) do |response|
          respond_with_object(response, "financial_transaction")
        end
      end

      def destroy(entity_id, deposit_account_id, id)
        # Delete a financial transaction
        #
        # [API]
        #   Method: <tt>DELETE entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/:id</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#delete_destroy
        #
        ft_path = path(entity_id, deposit_account_id) + "/#{id}"
        http.delete(ft_path, body: {}) do |response|
          response
        end
      end

      def destroy_many(entity_id, deposit_account_id, ids=[])
        # Delete many financial transactions
        #
        # [API]
        #   Method: <tt>DELETE entities/:entity_id/deposit_accounts/:deposit_account_id/financial_transactions/destroy_many?selected_ids=:id1,id2,id3</tt>
        #
        #   Documentation: https://app.myfinance.com.br/docs/api/financial_transactions#delete_destroy_many
        #
        ft_path = destroy_many_path(entity_id, deposit_account_id, ids)
        http.delete(ft_path, body: {}) do |response|
          response
        end
      end


      private

      def path(entity_id, deposit_account_id)
        "/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions"
      end

      def destroy_many_path(entity_id, deposit_account_id, ids)
        path(entity_id, deposit_account_id) + "/destroy_many?selected_ids=#{ids.join(",")}"
      end
    end
  end
end

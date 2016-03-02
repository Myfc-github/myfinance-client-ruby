module Myfinance
  module Resources
    class FinancialTransaction < DefaultMethods
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

      private

      # args == entity_id, deposit_account_id, id=nil
      def endpoint(args=[])
        entity_id = args.shift
        deposit_account_id = args.shift
        
        str = "/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/financial_transactions"
        str << "/#{args.first}" unless args.empty?
        str
      end

      def resource_key
        'financial_transaction'
      end
    end
  end
end

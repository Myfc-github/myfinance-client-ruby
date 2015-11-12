module Myfinance
  module Resources
    class BankStatement < Base
      #
      # Find a specific bank_statement
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/deposit_accounts/:deposit_account_id/bank_statements/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/bank_statements
      #
      def find(entity_id, deposit_account_id, id)
        http.get("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/bank_statements/#{id}", body: {}) do |response|
          respond_with_object(response, 'bank_statement')
        end
      end
    end
  end
end

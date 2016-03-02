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

      #
      # Create a specific bank_statement
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/deposit_accounts/:deposit_account_id/bank_statements</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/bank_statements
      #
      def create(entity_id, deposit_account_id, params)
        http.post("/entities/#{entity_id}/deposit_accounts/#{deposit_account_id}/bank_statements", { body: params, content_type: "multipart/form-data" }) do |response|
          Myfinance::Entities::BankStatementImport.new({ url: response.headers["Location"], parsed_body: response.parsed_body })
        end
      end
    end
  end
end

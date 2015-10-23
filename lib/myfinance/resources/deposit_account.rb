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
    end
  end
end

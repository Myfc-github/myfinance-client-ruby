module Myfinance
  module Entities
    #
    # A wrapper to Myfinance financial transactions collection
    #
    class FinancialTransactionCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::FinancialTransaction.new(attributes["financial_transaction"]))
        end
      end
    end
  end
end

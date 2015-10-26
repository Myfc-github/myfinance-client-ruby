module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class DepositAccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::DepositAccount.new(attributes['deposit_account']))
        end
      end
    end
  end
end

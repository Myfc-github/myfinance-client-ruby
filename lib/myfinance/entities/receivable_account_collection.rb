module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class ReceivableAccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::ReceivableAccount.new(attributes['receivable_account']))
        end
      end
    end
  end
end

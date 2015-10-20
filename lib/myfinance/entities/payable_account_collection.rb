module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class PayableAccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::PayableAccount.new(attributes['payable_account']))
        end
      end
    end
  end
end

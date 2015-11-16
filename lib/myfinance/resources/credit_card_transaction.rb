module Myfinance
  module Resources
    class CreditCardTransaction < DefaultMethods
      def find_all
      end

      private

      # args == entity_id, credit_card_id, id=nil
      def endpoint(args=[])
        entity_id = args.shift
        credit_card_id = args.shift

        str = "/entities/#{entity_id}/credit_cards/#{credit_card_id}/transactions"
        str << "/#{args.first}" unless args.empty?
        str
      end

      def resource_key
        'credit_card_transaction'
      end
    end
  end
end

module Myfinance
  module Resources
    class CreditCard < DefaultMethods

      private

      # args == entity_id, id=nil
      def endpoint(args=[])
        str = "/entities/#{args.shift}/credit_cards"
        str << "/#{args.first}" unless args.empty?
        str
      end

      def resource_key
        'credit_card'
      end
    end
  end
end

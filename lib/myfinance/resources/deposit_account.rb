module Myfinance
  module Resources
    class DepositAccount < DefaultMethods

      private

      # args == entity_id, id=nil
      def endpoint(args=[])
        str = "/entities/#{args.shift}/deposit_accounts"
        str << "/#{args.first}" unless args.empty?
        str
      end

      def resource_key
        'deposit_account'
      end
    end
  end
end

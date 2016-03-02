module Myfinance
  module Resources
    class Category < DefaultMethods

      private

      def resource_key(plural=nil)
        return 'categories' if plural
        'category'
      end
    end
  end
end

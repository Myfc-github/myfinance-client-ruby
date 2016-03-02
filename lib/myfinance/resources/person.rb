module Myfinance
  module Resources
    class Person < DefaultMethods
      private

      def resource_key(plural=nil)
        return 'people' if plural
        'person'
      end
    end
  end
end

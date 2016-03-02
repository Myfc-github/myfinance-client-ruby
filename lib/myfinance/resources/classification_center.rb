module Myfinance
  module Resources
    class ClassificationCenter < DefaultMethods

      private

      def resource_key(plural=nil)
        return 'classification_centers' if plural
        'classification_center'
      end
    end
  end
end

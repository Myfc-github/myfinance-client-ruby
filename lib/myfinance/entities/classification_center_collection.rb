module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class ClassificationCenterCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::ClassificationCenter.new(attributes['classification_center']))
        end
      end
    end
  end
end

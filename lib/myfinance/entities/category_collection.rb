module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class CategoryCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::Category.new(attributes['category']))
        end
      end
    end
  end
end

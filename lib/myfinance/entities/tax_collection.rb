module Myfinance
  module Entities
    #
    # A wrapper to Myfinance classification center
    #
    class TaxCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::Tax.new(
              attributes["tax"]
            )
          )
        end
      end
    end
  end
end

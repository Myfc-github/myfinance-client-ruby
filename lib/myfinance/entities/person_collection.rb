module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class PersonCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::Person.new(attributes['person']))
        end
      end
    end
  end
end

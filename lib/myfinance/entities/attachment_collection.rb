module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class AttachmentCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::Attachment.new(attributes['attachment']))
        end
      end
    end
  end
end

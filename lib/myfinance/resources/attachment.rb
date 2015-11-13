module Myfinance
  module Resources
    class Attachment < DefaultMethods

      #
      # Generate a empty object from attachment
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments/new</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#get_new
      #
      def get_new(entity_id)
        http.get("/entities/#{entity_id}/attachments/new", body: {}) do |response|
          respond_with_object(response, 'attachment')
        end
      end

      #
      # Find a specific download attachment
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments/:id/download</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#get_show
      #
      def download(entity_id, id)
        http.get("/entities/#{entity_id}/attachments/#{id}/download", body: {}) do |response|
          Myfinance::Entities::AttachmentDownload.new(response.parsed_body)
        end
      end

      private

      # args == entity_id, id=nil
      def endpoint(args=[])
        str = "/entities/#{args.shift}/attachments"
        str << "/#{args.first}" unless args.empty?
        str
      end

      def resource_key
        'attachment'
      end
    end
  end
end

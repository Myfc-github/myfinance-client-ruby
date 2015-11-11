module Myfinance
  module Resources
    class Attachment < Base
      #
      # List all attachments of the user
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#get_index
      #
      def find_all(entity_id)
        http.get("/entities/#{entity_id}/attachments", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific attachment
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#get_show
      #
      def find(entity_id, id)
        http.get("/entities/#{entity_id}/attachments/#{id}", body: {}) do |response|
          respond_with_object(response, 'attachment')
        end
      end

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
      # Create a specific attachment
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/attachments</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#post_create
      #
      def create(entity_id, params)
        http.post("/entities/#{entity_id}/attachments", { body: params, content_type: "multipart/form-data" }) do |response|
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

      #
      # Update a specific attachment
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/attachments/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#put_update
      #
      def update(entity_id, id, params)
        http.put("/entities/#{entity_id}/attachments/#{id}", { body: params, content_type: "multipart/form-data" }) do |response|
          respond_with_object(response, 'attachment')
        end
      end

      #
      # Delete a specific attachment
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/attachments/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/attachments#delete_destroy
      #
      def destroy(entity_id, id)
        http.delete("/entities/#{entity_id}/attachments/#{id}", body: {}) do |response|
          response.code
        end
      end
    end
  end
end

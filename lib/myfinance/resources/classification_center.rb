module Myfinance
  module Resources
    #
    # A wrapper to Myfinance classification center API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers
    #
    class ClassificationCenter < Base
      #
      # List all classification centers
      #
      # [API]
      #   Method: <tt>GET /classification_centers</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#get_index
      #
      def find_all(page = nil)
        http.get(index_endpoint(page)) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Show a classification center
      #
      # [API]
      #   Method: <tt>GET /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#get_show
      #
      def find(id)
        http.get("/classification_centers/#{id}", body: {}) do |response|
          respond_with_object response, "classification_center"
        end
      end

      #
      # Find classification centers by attributtes
      #
      # [API]
      #   Method: <tt>GET /classification_centers</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers
      #
      def find_by(params, page = nil)
        values = params.map { |k,v| "search[#{k}]=#{v}" }.join("&")
        search_endpoint = endpoint + "?#{values}"
        search_endpoint += "&page=#{page}" if page
        encoded_endpoint = URI.encode(search_endpoint)

        http.get(encoded_endpoint, body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Creates a classification center
      #
      # [API]
      #   Method: <tt>POST /classification_centers</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#post_create
      #
      def create(params)
        http.post(endpoint, body: { classification_center: params }) do |response|
          respond_with_object response, "classification_center"
        end
      end

      #
      # Updates a classification center
      #
      # [API]
      #   Method: <tt>PUT /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#put_update
      #
      def update(id, params)
        http.put(endpoint + "/#{id}", body: { classification_center: params }) do |response|
          respond_with_object response, "classification_center"
        end
      end

      #
      # Destroy a classification center
      #
      # [API]
      #   Method: <tt>DELETE /classification_centers/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/classification_centers#delete_destroy
      #
      def destroy(id)
        http.delete(endpoint + "/#{id}") do |response|
          respond_with_object response, "classification_center"
        end
      end

      private

      def endpoint
        "/classification_centers" 
      end

      def index_endpoint(page)
        return endpoint unless page
        endpoint + "?page=#{page}"
      end
    end
  end
end

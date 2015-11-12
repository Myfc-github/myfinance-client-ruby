module Myfinance
  module Resources
    class Category < Base
      #
      # List all categories
      #
      # [API]
      #   Method: <tt>GET /categories</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/categories#get_index
      #
      def find_all
        http.get('/categories', body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific category
      #
      # [API]
      #   Method: <tt>GET /categories/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/categories#get_show
      #
      def find(id)
        http.get("/categories/#{id}", body: {}) do |response|
          respond_with_object(response, 'category')
        end
      end

      #
      # Create a specific category
      #
      # [API]
      #   Method: <tt>POST /categories</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/categories#post_create
      #
      def create(params)
        http.post("/categories", body: params) do |response|
          respond_with_object(response, 'category')
        end
      end

      #
      # Update a specific category
      #
      # [API]
      #   Method: <tt>PUT /categories/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/categories#put_update
      #
      def update(id, params)
        http.put("/categories/#{id}", body: params) do |response|
          respond_with_object(response, 'category')
        end
      end

      #
      # Delete a specific category
      #
      # [API]
      #   Method: <tt>DELETE /categories/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/categories#delete_destroy
      #
      def destroy(id)
        http.delete("/categories/#{id}", body: {}) do |response|
          response.code
        end
      end
    end
  end
end

module Myfinance
  module Resources
    class Person < Base
      #
      # List all people
      #
      # [API]
      #   Method: <tt>GET /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_index
      #
      def find_all
        http.get('/people', body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a specific person
      #
      # [API]
      #   Method: <tt>GET /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_show
      #
      def find(person_id)
        http.get("/people/#{person_id}", body: {}) do |response|
          respond_with_object(response, 'person')
        end
      end

      #
      # Create a specific person
      #
      # [API]
      #   Method: <tt>POST /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#post_create
      #
      def create(params)
        http.post("/people", body: params) do |response|
          respond_with_object(response, 'person')
        end
      end

      #
      # Update a specific person
      #
      # [API]
      #   Method: <tt>PUT /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#put_update
      #
      def update(person_id, params)
        http.put("/people/#{person_id}", body: params) do |response|
          respond_with_object(response, 'person')
        end
      end

      #
      # Delete a specific person
      #
      # [API]
      #   Method: <tt>DELETE /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#delete_destroy
      #
      def destroy(person_id)
        http.delete("/people/#{person_id}", body: {}) do |response|
          response.code
        end
      end
    end
  end
end

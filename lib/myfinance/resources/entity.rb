module Myfinance
  module Resources
    class Entity < DefaultMethods

      #
      # Return attributes from entity
      #
      # [API]
      #   Method: <tt>GET /entities/new</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/entities#get_new
      #
      def get_new
        http.get("/entities/new", body: {}) do |response|
          respond_with_object(response, 'entity')
        end
      end

      private

      def resource_key(plural=nil)
        return 'entities' if plural
        'entity'
      end
    end
  end
end

module Myfinance
  module Resources
    #
    # A wrapper to Myfinance taxes API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/taxes
    #
    class Tax < Base
      #
      # List all taxes
      #
      # [API]
      #   Method: <tt>GET /taxes</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/taxes#get_index
      #
      def find_all
        http.get("/taxes", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Show a tax
      #
      # [API]
      #   Method: <tt>GET /taxes/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/taxes#get_show
      #
      def find(id)
        http.get("/taxes/#{id}", body: {}) do |response|
          respond_with_object(response, "tax")
        end
      end
   end
  end
end

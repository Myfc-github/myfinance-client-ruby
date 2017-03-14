module Myfinance
  module Resources
    class FinancialAccount < Base

      def initialize(http)
        @http = http
        set_method_for(pay_or_receive_method)
        set_method_for(undo_payment_or_receivement)
      end
      #
      # Creates a payable/receivable account
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/payable_accounts</tt>
      #   Method: <tt>POST /entities/:entity_id/receivable_accounts</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#post_create
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#post_create
      #
      def create(entity_id, params = {})
        request_and_build_response(:post, endpoint_for(nil, entity_id, :create), params)
      end

      #
      # Updates a payable/receivable account
      #
      # [API]
      #   Method: <tt>PUT /entities/:entity_id/payable_accounts/:id</tt>
      #   Method: <tt>PUT /entities/:entity_id/receivable_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#put_update
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#put_update
      #
      def update(id, entity_id, params = {})
        request_and_build_response(:put, endpoint_for(id, entity_id, :update), params)
      end

      #
      # Destroys a payable/receivable account
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/payable_accounts/:id</tt>
      #   Method: <tt>DELETE /entities/:entity_id/receivable_accounts/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy
      #   Documentation: https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy
      #
      def destroy(id, entity_id)
        http.delete(endpoint_for(id, entity_id, :destroy)) do |_response|
          true
        end
      end

      private

      def request_and_build_response(method, endpoint, params={})
        http.send(method, endpoint, body: { resource_key => params }) do |response|
          respond_with_object(response, resource_key)
        end
      end

      def endpoint_for(id, entity_id, key)
        parameterize_endpoint(id, entity_id, key)
      end

      def default_endpoints
        {
          create: "/entities/:entity_id/#{resource_key}s",
          update: "/entities/:entity_id/#{resource_key}s/:id",
          destroy: "/entities/:entity_id/#{resource_key}s/:id"
        }
      end

      def parameterize_endpoint(id, entity_id, key)
        endpoints[key.to_sym].gsub(':entity_id', entity_id.to_s).gsub(':id', id.to_s)
      end

      def set_method_for(action)
        self.class.send(:define_method, action) do |id, entity_id, params={}|
          request_and_build_response(:put, endpoint_for(id, entity_id, action), params)
        end
      end
    end
  end
end

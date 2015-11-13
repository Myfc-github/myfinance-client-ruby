module Myfinance
  module Resources
    class DefaultMethods < Base

      def find_all(*args)
        http.get(endpoint(args), body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(*args)
        http.get(endpoint(args), body: {}) do |response|
          respond_with_object(response, resource_key)
        end
      end

      def create(*args)
        params = args.pop
        http.post(endpoint(args), body: params) do |response|
          respond_with_object(response, resource_key)
        end
      end

      def update(*args)
        params = args.pop
        http.put(endpoint(args), body: params) do |response|
          respond_with_object(response, resource_key)
        end
      end

      def destroy(*args)
        http.delete(endpoint(args), body: {}) do |response|
          response.code
        end
      end

      private

      # args == id=nil
      def endpoint(args=[])
        str = "/#{resource_key(true)}"
        str << "/#{args.first}" unless args.empty?
        str
      end
    end
  end
end

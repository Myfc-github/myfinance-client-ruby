module Myfinance
  class Request

    def initialize(args)
      @args = args
    end

    def run
      request.run
      request.response
    end

    private

    attr_reader :args

    def request
      @request ||= Typhoeus::Request.new(args[:url], options)
    end

    def options
      {
        method:           args[:method],
        params:           args[:params],
        body:             body,
        headers:          headers,
        accept_encoding:  "gzip"
      }.reject { |_k,v| v.nil? }
    end

    def headers
      headers = args.fetch(:headers) { {} }

      {
        "Accept"         => "application/json",
        "Content-Type"   => content_type,
        "User-Agent"     => args[:user_agent],
        "Authorization"  => "Basic #{authorization_hash}",
        "ACCOUNT_ID"     => args[:account_id]
      }.merge(headers).delete_if { |_,v| v.nil? || v.to_s.empty? }
    end

    def body
      body = args[:body]
      body = MultiJson.dump(body) if body.is_a?(Hash) && !args[:multipart]
      body
    end

    def authorization_hash
      ::Base64.strict_encode64("#{args[:token]}:X")
    end

    def content_type
      args[:multipart] ? nil : "application/json"
    end
  end
end

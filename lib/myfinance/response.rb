require "myfinance/exception"

module Myfinance
  RequestTimeout = Class.new(Exception)
  RequestError   = Class.new(Exception)

  class Response < SimpleDelegator

    def resolve!(&block)
      if success? || moved!
        block_given? ? yield(self) : self
      elsif timed_out?
        timeout!
      else
        error!
      end
    end

    def parsed_body(key=nil)
      return MultiJson.load(self.body)[key] unless key.nil?
      MultiJson.load(self.body)
    rescue MultiJson::ParseError
      {}
    end

    private

    def moved!
      [302].include?(self.code)
    end

    def timeout!
      raise RequestTimeout
    end

    def error!
      raise RequestError.new(
        code:    code,
        message: request_error_message,
        body:    parsed_body
      )
    end

    def request_error_message
      return status_message if !status_message.nil? && status_message != ""
      parsed_body["error"] || ""
    end
  end
end

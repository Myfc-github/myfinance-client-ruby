module Myfinance
  module Entities
    #
    # A wrapper to Myfinance collection returns from API. This wrapper represents a collection and it's responsible for processing pagination information as well.
    #
    class Collection < Base
      PAGE_REGEX = /page=(\d+)/

      attr_reader :response, :collection, :headers

      def initialize(response)
        @response = response
        @collection = []
        @headers = response.headers['Link'].split(',') rescue []
      end

      def self.build(response)
        self.new(response).build
      end

      def build
        build_collection
        self
      end

      def next_page
        page_for(:next)
      end

      def last_page
        page_for(:last)
      end

      def previous_page
        page_for(:prev)
      end

      def first_page
        page_for(:first)
      end

      private

      def page_for(page_rel)
        header_link_for(page_rel).match(PAGE_REGEX)[1].to_i rescue nil
      end

      def header_link_for(rel)
        headers.select{|n| n =~ /rel=#{rel}/}.first
      end

      def build_collection
        raise NotImplementedError
      end
    end
  end
end

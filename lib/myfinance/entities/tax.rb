module Myfinance
  module Entities
    class Tax < Base
      attribute :id, Integer
      attribute :name, String
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end

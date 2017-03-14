module Myfinance
  module Entities
    class DepositAccount < Base
      attribute :archive, Boolean
      attribute :bank_account_id, Integer
      attribute :created_at, DateTime
      attribute :currency_id, Integer
      attribute :deposit_account_type_id, Integer
      attribute :description, String
      attribute :entity_id, Integer
      attribute :force_destroy, Boolean
      attribute :id, Integer
      attribute :imported_from_sync, Boolean
      attribute :initial_balance, Decimal
      attribute :last_transaction_date, Date
      attribute :name, String
      attribute :sync_response, String
      attribute :updated_at, DateTime
      attribute :calculated_balance, String
      attribute :logo_image_url, String
      attribute :links, Array
    end
  end
end

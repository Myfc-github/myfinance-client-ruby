module Myfinance
  module Entities
    class SaleAccount < Base
      attribute :category_id
      attribute :classification_center_id
      attribute :consolidate
      attribute :created_at
      attribute :custom_classifications, Array[Hash]
      attribute :classification_center_classifications, Array[Hash]
      attribute :description
      attribute :entity_id
      attribute :id
      attribute :name
      attribute :payment_methods
      attribute :person_id
      attribute :provider
      attribute :updated_at
      attribute :expected_deposit_account_id
    end
  end
end

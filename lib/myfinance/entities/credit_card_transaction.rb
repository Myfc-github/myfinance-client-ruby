module Myfinance
  module Entities
    class CreditCardTransaction < Base
      attribute :id, Integer
      attribute :credit_card_invoice_id, Integer
      attribute :credit_card_id, Integer
      attribute :classification_center_id, Integer
      attribute :category_id, Integer
      attribute :custom_classifications, Array[Hash]
      attribute :classification_center_classifications, Array[Hash]
      attribute :amount, Decimal
      attribute :description, String
      attribute :occurred_at, Date
      attribute :type, String
      attribute :document, String
      attribute :observation, String
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :invoice_payment, Boolean
      attribute :excel_import_id, Integer
      attribute :financial_account_id, Integer
      attribute :person_id, Integer
      attribute :moved, Boolean
      attribute :recurrence_id, Integer
      attribute :indexed_at, DateTime
    end
  end
end

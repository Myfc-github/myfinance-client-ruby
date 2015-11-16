module Myfinance
  module Entities
    class CreditCardTransaction < Base
      attribute :amount, Decimal
      attribute :occurred_at, Date
      attribute :links, Array[Hash[String => String]]

      [:invoice_payment, :moved].each { |k| attribute k, Boolean }
      [:indexed_at, :created_at, :updated_at].each { |k| attribute k, DateTime }
      [:description, :type, :document, :observation].each { |k| attribute k, String }

      [
        :id, :credit_card_invoice_id, :classification_center_id, :category_id,
        :excel_import_id, :financial_account_id, :person_id, :recurrence_id
      ].each { |k| attribute k, Integer }
    end
  end
end

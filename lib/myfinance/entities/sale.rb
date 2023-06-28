module Myfinance
  module Entities
    class Sale < Base
      attribute :amount_difference
      attribute :attachments
      attribute :attachments_count
      attribute :category_id
      attribute :classification_center_id
      attribute :classification_center_classifications, Array[Hash]
      attribute :competency_month
      attribute :confirmed_at
      attribute :created_at
      attribute :custom_classifications, Array[Hash]
      attribute :days_to_liquidation
      attribute :description
      attribute :discount_amount
      attribute :document
      attribute :document_emission_date
      attribute :estimated_liquidated_at
      attribute :fee_percentage
      attribute :fee_percentage_amount
      attribute :financial_account_id
      attribute :fixed_fee_amount
      attribute :id
      attribute :installment_count
      attribute :installment_number
      attribute :installments, Array[Hash]
      attribute :interest_amount
      attribute :issuer
      attribute :links
      attribute :liquidated_at
      attribute :liquidation_weekday
      attribute :net_amount
      attribute :nominal_amount
      attribute :observation
      attribute :occurred_at
      attribute :original_sale_id
      attribute :payment_method
      attribute :person_id
      attribute :provider_code
      attribute :receivable_amount
      attribute :sale_account_id
      attribute :status
      attribute :summary
      attribute :tax_charges
      attribute :ticket_amount
      attribute :total_amount
      attribute :updated_at
      attribute :receivable_account_total_amount
    end
  end
end

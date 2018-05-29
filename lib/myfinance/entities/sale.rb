module Myfinance
  module Entities
    class Sale < Base
      attribute :api_related
      attribute :attachments
      attribute :attachments_count
      attribute :category_id
      attribute :classification_center_id
      attribute :confirmed_at
      attribute :created_at
      attribute :custom_classifications
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
      attribute :interest_amount
      attribute :issuer
      attribute :links
      attribute :liquidated_at
      attribute :liquidation_weekday
      attribute :net_amount
      attribute :nominal_amount
      attribute :observation
      attribute :occurred_at
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
    end
  end
end

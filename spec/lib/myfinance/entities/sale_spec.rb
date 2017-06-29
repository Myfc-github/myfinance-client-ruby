require "spec_helper"

describe Myfinance::Entities::Sale do
  it_behaves_like "entity_attributes", %i[
    api_related
    attachments_count
    category_id
    classification_center_id
    confirmed_at
    created_at
    custom_classifications
    custom_classifications
    days_to_liquidation
    description
    discount_amount
    estimated_liquidated_at
    fee_percentage
    fee_percentage_amount
    financial_account_id
    fixed_fee_amount
    id
    interest_amount
    issuer
    liquidated_at
    liquidation_weekday
    nominal_amount
    observation
    occurred_at
    payment_method
    person_id
    receivable_amount
    sale_account_id
    status
    summary
    tax_charges_attributes
    ticket_amount
    total_amount
    updated_at
  ]
end

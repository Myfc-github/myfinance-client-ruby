require "spec_helper"

describe Myfinance::Entities::SaleAccount do
  it_behaves_like "entity_attributes", %i[
    category_id
    classification_center_id
    consolidate
    created_at
    custom_classifications
    description
    entity_id
    expected_deposit_account_id
    id
    name
    payment_methods
    person_id
    provider
    updated_at
  ]
end

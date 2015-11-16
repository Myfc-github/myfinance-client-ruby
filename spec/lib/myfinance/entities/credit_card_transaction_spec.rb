require 'spec_helper'

describe Myfinance::Entities::CreditCardTransaction do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :amount, :occurred_at, :links, :invoice_payment, :moved, :indexed_at, :created_at,
    :updated_at, :description, :type, :document, :observation, :id,
    :credit_card_invoice_id, :classification_center_id, :category_id,
    :excel_import_id, :financial_account_id, :person_id, :recurrence_id
  ]
end

require 'spec_helper'

describe Myfinance::Entities::ReceivableAccount do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :entity_id, :status, :status_name, :due_date, :occurred_at, :ticket_amount, :interest_amount, :amount,
    :discount_amount, :total_amount, :description, :document, :document_emission_date, :observation, :remind,
    :reminded_at, :income_tax_relevant, :category_id, :classification_center_id, :expected_deposit_account_id,
    :recurrence_id, :person_id, :recurrent, :parcelled, :recurrence_period, :number_of_parcels, :current_parcel,
    :competency_month, :tax_charges_attributes, :reconciliations, :links, :created_at, :updated_at
  ]
end

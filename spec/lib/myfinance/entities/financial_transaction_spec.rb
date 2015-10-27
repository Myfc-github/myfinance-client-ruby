require 'spec_helper'

describe Myfinance::Entities::FinancialTransaction do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :absolute_amount, :amount, :balance_difference, :force_destroy,
    :imported_from_sync, :is_pending, :reconciled, :bank_statement_id,
    :category_id, :classification_center_id, :currency_id, :deposit_account_id,
    :id, :owner_id, :parent_id, :person_id, :transfer_deposit_account_id,
    :transfer_id, :document, :notes, :observation, :original_description,
    :user_description, :type, :guid, :created_at, :updated_at, :occurred_at,
    :attachment_id_list, :reconciliations, :links
  ]
end

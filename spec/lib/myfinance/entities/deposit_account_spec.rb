require 'spec_helper'

describe Myfinance::Entities::DepositAccount do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :logo_image_url, :name, :archive, :force_destroy, :imported_from_sync,
    :archived_at,:created_at, :updated_at, :currency_id, :deposit_account_type_id,
    :entity_id, :id, :bank_account_id, :last_transaction_date, :links,
    :description, :sync_response, :initial_balance, :calculated_balance
  ]
end

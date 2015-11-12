require 'spec_helper'

describe Myfinance::Entities::BankStatement do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :file_updated_at, :created_at, :updated_at, :file_content_type,
    :file_file_name, :deposit_account_id, :event_id, :id, :file_file_size,
    :future_items_ignored_count, :amount_zero_items_ignored_count, :invalid_date_items_ignored_count
  ]
end

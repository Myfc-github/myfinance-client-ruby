require 'spec_helper'

describe Myfinance::Entities::Category do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :interested_users_ids, :created_at, :updated_at, :name, :guid, :full_name,
    :id, :account_id, :parent_id, :use_count, :excel_import_id,
    :imported_from_sync, :cost, :revenue, :force_destroy, :modified_by_sync
  ]
end

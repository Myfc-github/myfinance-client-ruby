require 'spec_helper'

describe Myfinance::Entities::ClassificationCenter do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :name, :guid, :created_at, :updated_at, :id, :entity_id, :use_count,
    :excel_import_id, :imported_from_sync, :cost_center, :revenue_center,
    :modified_by_sync
  ]
end

require 'spec_helper'

describe Myfinance::Entities::CreditCard do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :balance, :destroying, :archived_at, :created_at, :updated_at,
    :name, :observation, :flag, :id, :entity_id, :expiration_day, :closing_day,
    :excel_import_id, :category_id, :classification_center_id, :person_id
  ]
end

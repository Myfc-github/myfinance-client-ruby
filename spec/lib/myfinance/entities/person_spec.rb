require 'spec_helper'

describe Myfinance::Entities::Person do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :note, :interested_users_ids, :created_at, :updated_at, :imported_from_sync,
    :supplier, :customer, :force_destroy, :modified_by_sync, :id, :account_id,
    :federation_subscription_type_id, :use_count, :excel_import_id,
    :site, :email, :phone, :address, :address_number, :complement, :neighborhood,
    :city, :state, :country, :zip_code, :person_type, :name,
    :federation_subscription_number, :febraban_name, :febraban_favored_code,
    :federation_subscription_number_only_numbers, :guid
  ]
end

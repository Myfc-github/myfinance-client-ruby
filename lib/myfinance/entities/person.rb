module Myfinance
  module Entities
    class Person < Base
      attribute :interested_users_ids, Array

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      [
        :imported_from_sync, :supplier, :customer,
        :force_destroy, :modified_by_sync,
      ].each { |k| attribute k, Boolean }

      [
        :id, :account_id, :federation_subscription_type_id, :use_count,
        :excel_import_id
      ].each { |k| attribute k, Integer }

      [
        :site, :email, :phone, :address, :address_number, :complement, :neighborhood,
        :city, :state, :country, :zip_code, :person_type, :name, :note,
        :federation_subscription_number, :febraban_name, :febraban_favored_code,
        :federation_subscription_number_only_numbers, :guid
      ].each { |k| attribute k, String }
    end
  end
end

module Myfinance
  module Entities
    class Category < Base
      attribute :interested_users_ids, Array

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      [:name, :guid, :full_name].each { |k| attribute k, String }

      [:id, :account_id, :parent_id, :use_count, :excel_import_id].each { |k| attribute k, Integer }

      [:imported_from_sync, :cost, :revenue, :force_destroy, :modified_by_sync].each { |k| attribute k, Boolean }
    end
  end
end

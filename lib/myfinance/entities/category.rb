module Myfinance
  module Entities
    class Category < Base
      attribute :account_id, Integer
      attribute :cost, Boolean
      attribute :created_at, DateTime
      attribute :excel_import_id, Integer
      attribute :force_destroy, Boolean
      attribute :full_name, String
      attribute :guid, String
      attribute :id, Integer
      attribute :imported_from_sync, Boolean
      attribute :interested_users_ids, Array
      attribute :modified_by_sync, Boolean
      attribute :name, String
      attribute :parent_id, Integer
      attribute :revenue, Boolean
      attribute :updated_at, DateTime
      attribute :use_count, Integer
      attribute :archived_at, DateTime
    end
  end
end

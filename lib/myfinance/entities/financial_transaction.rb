module Myfinance
  module Entities
    class FinancialTransaction < Base
      attribute :classification_center_id, Integer
      attribute :deposit_account_id, Integer
      attribute :person_id, Integer
      attribute :parent_id, Integer
      attribute :owner_id, Integer
      attribute :currency_id, Integer
      attribute :category_id, Integer
      attribute :type, String
      attribute :occurred_at, Date
      attribute :document, String
      attribute :original_description, String
      attribute :user_description, String
      attribute :notes, String
      attribute :amount, Decimal
      attribute :id, Integer
      attribute :is_pending, Boolean
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :guid, String
      attribute :imported_from_sync, Boolean
      attribute :transfer_id, Integer
      attribute :absolute_amount, Decimal
      attribute :bank_statement_id, Integer
      attribute :balance_difference, Boolean
      attribute :force_destroy, Boolean
      attribute :divided, Boolean
      attribute :attachments_count, Integer
      attribute :duplicity_suspicion_id, Integer
      attribute :excel_import_id, Integer
      attribute :observation, String
      attribute :api_related, Boolean
      attribute :bank_slips_count, Integer
      attribute :reconciled, Boolean
      attribute :indexed_at, DateTime
      attribute :automatic_rule_related, Boolean
    end
  end
end

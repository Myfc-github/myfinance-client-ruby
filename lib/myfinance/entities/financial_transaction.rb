module Myfinance
  module Entities
    class FinancialTransaction < Base
      [:absolute_amount, :amount].each { |k| attribute k, Decimal }

      [:balance_difference, :force_destroy, :imported_from_sync, :is_pending, :reconciled, :divided].each { |k| attribute k, Boolean }

      [:bank_statement_id, :category_id, :classification_center_id,
        :currency_id, :deposit_account_id, :id, :owner_id, :parent_id, :person_id,
        :transfer_deposit_account_id, :transfer_id, :attachments_count].each { |k| attribute k, Integer }

      [:document, :notes, :observation, :original_description, :user_description,
        :type, :guid].each { |k| attribute k, String }

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      attribute :occurred_at, Date
      attribute :attachment_id_list, Array
      attribute :reconciliations, Hash[String => Array]
      attribute :links, Array[Hash[String => String]]
    end
  end
end

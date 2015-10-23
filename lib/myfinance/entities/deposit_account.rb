module Myfinance
  module Entities
    class FinancialAccount < Base
      [:logo_image_url, :name].each { |k| attribute k, String }

      [:archive, :force_destroy, :imported_from_sync].each { |k| attribute k, Boolean }

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      [:currency_id, :deposit_account_type_id, :entity_id, :id, :bank_account_id].each do |k|
        attribute k, Integer
      end

      attribute :last_transaction_date, Date

      attribute :links, Array[Hash[String => String]]

      [:description, :sync_response].each { |k| attribute k, Date }

      [:initial_balance, :calculated_balance].each { |k| attribute k, Decimal }
    end
  end
end

module Myfinance
  module Entities
    class DepositAccount < Base
      [:logo_image_url, :name].each { |k| attribute k, String }

      [:archive, :force_destroy, :imported_from_sync].each { |k| attribute k, Boolean }

      [:archived_at, :created_at, :updated_at].each { |k| attribute k, DateTime }

      [:currency_id, :deposit_account_type_id, :entity_id, :id, :bank_account_id].each do |k|
        attribute k, Integer
      end

      attribute :sync_response, Hash

      attribute :links, Array[Hash[String => String]]

      [:description, :last_transaction_date].each { |k| attribute k, Date }

      [:initial_balance, :calculated_balance].each { |k| attribute k, Decimal }
    end
  end
end

module Myfinance
  module Entities
    class FinancialAccount < Base
      [:id, :entity_id, :status, :category_id, :person_id, :recurrence_id, :number_of_parcels,
        :current_parcel, :classification_center_id, :expected_deposit_account_id].each do |k|
        attribute k, Integer
      end

      [:status_name, :description, :document, :observation, :recurrence_period,
        :competency_month].each { |k| attribute k, String }

      [:amount, :interest_amount, :discount_amount, :total_amount, :ticket_amount].each do |k|
        attribute k, Decimal
      end

      [:remind, :income_tax_relevant, :recurrent, :parcelled, :ticket_amount].each do |k|
        attribute k, Boolean
      end

      [:due_date, :occurred_at, :document_emission_date, :reminded_at].each do |k|
        attribute k, Date
      end
      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      attribute :tax_charges_attributes, Array[Hash]
      attribute :reconciliations, Hash[String => Array]
      attribute :links, Array[Hash[String => String]]
    end
  end
end

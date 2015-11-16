module Myfinance
  module Entities
    class CreditCard < Base
      attribute :balance, Decimal
      attribute :destroying, Boolean
      attribute :links, Array[Hash[String => String]]

      [:archived_at, :created_at, :updated_at].each { |k| attribute k, DateTime }

      [:name, :observation, :flag, :flag_image_url].each { |k| attribute k, String }

      [
        :id, :entity_id, :expiration_day, :closing_day,
        :excel_import_id, :category_id, :classification_center_id, :person_id,
      ].each { |k| attribute k, Integer }
    end
  end
end

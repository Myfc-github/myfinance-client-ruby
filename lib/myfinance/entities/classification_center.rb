module Myfinance
  module Entities
    class ClassificationCenter < Base
      [:name, :guid].each { |k| attribute k, String }
      [:created_at, :updated_at].each { |k| attribute k, DateTime }
      [:id, :entity_id, :use_count, :excel_import_id].each { |k| attribute k, Integer }
      [:imported_from_sync, :cost_center, :revenue_center, :modified_by_sync].each { |k| attribute k, Boolean }
    end
  end
end

module Myfinance
  module Entities
    class BankStatement < Base
      [:file_updated_at, :created_at, :updated_at].each { |k| attribute k, DateTime }
      [:file_content_type, :file_file_name].each { |k| attribute k, String }

      [:deposit_account_id, :event_id, :id, :file_file_size,
        :future_items_ignored_count, :amount_zero_items_ignored_count,
        :invalid_date_items_ignored_count].each do |k|
          attribute k, Integer
        end
    end
  end
end

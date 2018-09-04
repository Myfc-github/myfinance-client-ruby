require "spec_helper"

describe Myfinance::Entities::FinancialTransaction do
  it_behaves_like "entity_attributes", %i[deposit_account_id person_id parent_id owner_id currency_id
                                          category_id type occurred_at document original_description
                                          user_description notes amount id is_pending created_at
                                          updated_at guid imported_from_sync transfer_id absolute_amount
                                          bank_statement_id balance_difference force_destroy divided
                                          attachments_count duplicity_suspicion_id excel_import_id
                                          observation api_related bank_slips_count reconciled indexed_at
                                          automatic_rule_related classification_center_id
                                          classification_center_classifications custom_classifications]
end

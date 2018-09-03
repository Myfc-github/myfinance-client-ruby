require "spec_helper"

describe Myfinance::Entities::CreditCardTransaction do
  it_behaves_like "entity_attributes", %i[credit_card_invoice_id classification_center_id category_id amount
                                          description occurred_at type document observation created_at
                                          updated_at invoice_payment excel_import_id financial_account_id
                                          person_id moved recurrence_id indexed_at credit_card_id id
                                          custom_classifications classification_center_classifications]
end

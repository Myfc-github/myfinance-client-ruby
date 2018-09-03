require "spec_helper"

describe Myfinance::Entities::CreditCard do
  it_behaves_like "entity_attributes", %i[created_at id name updated_at entity_id person_id flag
                                          flag_image_url observation classification_center_id category_id
                                          closing_day expiration_day custom_classifications
                                          classification_center_classifications]
end

require 'spec_helper'

describe Myfinance::Entities::Attachment do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :entity_id, :attachment_file_size, :title, :attachment_file_name,
    :attachment_content_type, :download_url, :created_at, :updated_at,
    :attachables, :links
  ]
end

require 'spec_helper'

describe Myfinance::Entities::AttachmentDownload do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :redirect_to
  ]
end

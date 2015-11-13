require 'spec_helper'

describe Myfinance::Entities::BankStatementImport do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :url, :parsed_body
  ]
end

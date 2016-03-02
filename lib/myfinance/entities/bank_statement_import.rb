module Myfinance
  module Entities
    class BankStatementImport < Base
      [:url, :parsed_body].each { |k| attribute k, String }
    end
  end
end

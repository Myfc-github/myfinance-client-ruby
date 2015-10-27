require "typhoeus"
require "multi_json"

require "myfinance/version"
require "myfinance/configuration"
require "myfinance/http"
require "myfinance/client"

require "myfinance/entities/base"
require "myfinance/entities/collection"
require "myfinance/entities/deposit_account"
require "myfinance/entities/entity"
require "myfinance/entities/financial_account"
require "myfinance/entities/financial_transaction"
require "myfinance/entities/payable_account"
require "myfinance/entities/receivable_account"
require "myfinance/entities/deposit_account_collection"
require "myfinance/entities/entity_collection"
require "myfinance/entities/financial_transaction_collection"
require "myfinance/entities/payable_account_collection"
require "myfinance/entities/receivable_account_collection"

require "myfinance/resources/base"
require "myfinance/resources/deposit_account"
require "myfinance/resources/entity"
require "myfinance/resources/financial_account"
require "myfinance/resources/financial_transaction"
require "myfinance/resources/payable_account"
require "myfinance/resources/receivable_account"

module Myfinance
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token, account_id = nil)
    Client.new(token, account_id)
  end
end

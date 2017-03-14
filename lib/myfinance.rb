require "typhoeus"
require "multi_json"
require 'mime/types'

require "myfinance/version"
require "myfinance/configuration"
require "myfinance/http"
require "myfinance/client"

require "myfinance/entities/base"
require "myfinance/entities/collection"
require "myfinance/entities/entity"
require "myfinance/entities/entity_collection"
require "myfinance/entities/attachment_collection"
require "myfinance/entities/financial_account"
require "myfinance/entities/payable_account"
require "myfinance/entities/receivable_account"
require "myfinance/entities/attachment"
require "myfinance/entities/classification_center"
require "myfinance/entities/classification_center_collection"
require "myfinance/entities/category"
require "myfinance/entities/category_collection"
require "myfinance/entities/account"
require "myfinance/entities/account_collection"
require "myfinance/entities/deposit_account"
require "myfinance/entities/deposit_account_collection"
require "myfinance/entities/person"
require "myfinance/entities/person_collection"
require "myfinance/entities/webhook"
require "myfinance/entities/webhook_collection"
require "myfinance/entities/tax"
require "myfinance/entities/tax_collection"

require "myfinance/resources/base"
require "myfinance/resources/entity"
require "myfinance/resources/financial_account"
require "myfinance/resources/payable_account"
require "myfinance/resources/receivable_account"
require "myfinance/resources/attachment"
require "myfinance/resources/classification_center"
require "myfinance/resources/category"
require "myfinance/resources/account"
require "myfinance/resources/deposit_account"
require "myfinance/resources/person"
require "myfinance/resources/webhook"
require "myfinance/resources/tax"

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

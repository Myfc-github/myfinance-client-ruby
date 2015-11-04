require "spec_helper"

describe Myfinance::Resources::FinancialTransaction do
  let(:entity_id) { 3798 }
  let(:deposit_account_id) { 14268 }
  let(:financial_transaction_id) { 1503930 }

  describe "#find_all", vcr: true do
    subject { client.financial_transactions.find_all(entity_id, deposit_account_id) }

    context "when success" do
      it "returns all financial_transactions" do
        expect(subject.class).to eq(Myfinance::Entities::FinancialTransactionCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::FinancialTransaction)
        expect(subject.collection.first.id).to eq(1503930)
        expect(subject.collection.size).to eq(1)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.find_all(entity_id, deposit_account_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

    describe "#find", vcr: true do
    context "when success" do
      subject { client.financial_transactions.find(entity_id, deposit_account_id, financial_transaction_id) }

      it "returns a find of financial_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::FinancialTransaction)
        expect(subject.id).to eq(1503930)
        expect(subject.type).to eq("Credit")
        expect(subject.deposit_account_id).to eq(14268)
        expect(subject.guid).to be_nil
        expect(subject.document).to be_nil
        expect(subject.original_description).to be_nil
        expect(subject.user_description).to be_nil
        expect(subject.bank_statement_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.parent_id).to be_nil
        expect(subject.category_id).to be_nil
        expect(subject.transfer_id).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.transfer_deposit_account_id).to be_nil
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.balance_difference).to be_falsy
        expect(subject.divided).to be_falsy
        expect(subject.reconciled).to be_falsy
        expect(subject.absolute_amount).to eq(100.0)
        expect(subject.amount).to eq(100.0)
        expect(subject.occurred_at).to eq(DateTime.parse("2015-10-27"))
        expect(subject.created_at).to eq(DateTime.parse("2015-10-27T16:44:33-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-27T16:44:33-02:00"))
        expect(subject.currency_id).to eq(1)
        expect(subject.attachments_count).to eq(0)
        expect(subject.attachment_id_list).to eq([])
        expect(subject.reconciliations).to eq(
          {
            "financial_accounts" => [],
            "financial_transactions" => []
          }
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.find(entity_id, deposit_account_id, financial_transaction_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#get_new", vcr: true do
    context "when success" do
      subject { client.financial_transactions.get_new(entity_id, deposit_account_id) }

      it "returns empty financial_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::FinancialTransaction)
        expect(subject.absolute_amount).to be_nil
        expect(subject.amount).to be_nil
        expect(subject.api_related).to be_falsy
        expect(subject.attachments_count).to eq(0)
        expect(subject.balance_difference).to be_falsy
        expect(subject.bank_slips_count).to eq(0)
        expect(subject.bank_statement_id).to be_nil
        expect(subject.category_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.currency_id).to be_nil
        expect(subject.deposit_account_id).to eq(14268)
        expect(subject.divided).to be_falsy
        expect(subject.document).to be_nil
        expect(subject.duplicity_suspicion_id).to be_nil
        expect(subject.excel_import_id).to be_nil
        expect(subject.force_destroy).to be_falsy
        expect(subject.id).to be_nil
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.indexed_at).to be_nil
        expect(subject.is_pending).to be_falsy
        expect(subject.notes).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.occurred_at).to eq(DateTime.parse("2015-11-03"))
        expect(subject.original_description).to be_nil
        expect(subject.owner_id).to be_nil
        expect(subject.parent_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.reconciled).to be_falsy
        expect(subject.transfer_id).to be_nil
        expect(subject.updated_at).to be_nil
        expect(subject.user_description).to be_nil
        expect(subject.type).to eq("Debit")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.get_new(entity_id, deposit_account_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        financial_transaction: {
          type: "Credit",
          deposit_account_id: deposit_account_id,
          occurred_at: Time.now,
          amount: 100.0
        }
      }
    end

    context "when success" do
      subject { client.financial_transactions.create(entity_id, deposit_account_id, params) }

      it "returns a created financial_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::FinancialTransaction)
        expect(subject.id).to eq(1503965)
        expect(subject.type).to eq("Credit")
        expect(subject.deposit_account_id).to eq(14268)
        expect(subject.guid).to be_nil
        expect(subject.document).to be_nil
        expect(subject.original_description).to be_nil
        expect(subject.user_description).to be_nil
        expect(subject.bank_statement_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.parent_id).to be_nil
        expect(subject.category_id).to be_nil
        expect(subject.transfer_id).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.transfer_deposit_account_id).to be_nil
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.balance_difference).to be_falsy
        expect(subject.divided).to be_falsy
        expect(subject.reconciled).to be_falsy
        expect(subject.absolute_amount).to eq(100.0)
        expect(subject.amount).to eq(100.0)
        expect(subject.occurred_at).to eq(DateTime.parse("2015-10-28"))
        expect(subject.created_at).to eq(DateTime.parse("2015-10-28T11:17:34-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-28T11:17:34-02:00"))
        expect(subject.currency_id).to eq(1)
        expect(subject.attachments_count).to eq(0)
        expect(subject.attachment_id_list).to eq([])
        expect(subject.reconciliations).to eq(
          {
            "financial_accounts" => [],
            "financial_transactions" => []
          }
        )
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/deposit_accounts/14268/financial_transactions/1503965",
              "method" => "get"
            },
            {
              "rel" => "destroy",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/deposit_accounts/14268/financial_transactions/1503965",
              "method" => "delete"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.create(entity_id, deposit_account_id, params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        financial_transaction: {
          observation: "This is an observation"
        }
      }
    end

    context "when success" do
      subject { client.financial_transactions.update(entity_id, deposit_account_id, 1503965, params) }

      it "returns a updated financial_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::FinancialTransaction)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.update(entity_id, deposit_account_id, 1503965, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.financial_transactions.destroy(entity_id, deposit_account_id, 1503965) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.financial_transactions.destroy(entity_id, deposit_account_id, 1503965) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy_many", vcr: true do
    let(:params) { { selected_ids: [1504017] } }
    subject { client.financial_transactions.destroy_many(entity_id, deposit_account_id, params) }

    context "when financial_transaction exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when financial_transaction does not exist" do
      subject { client.financial_transactions.destroy_many(1215631099, deposit_account_id, params) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

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
          [
            {
              "financial_accounts" => nil, nil => nil
            },
            {
              "financial_transactions" => nil, nil => nil
            }
          ]
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
end

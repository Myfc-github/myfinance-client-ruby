require "spec_helper"

describe Myfinance::Resources::CreditCardTransaction do
  let(:entity_id) { 3798 }
  let(:credit_card_id) { 43 }
=begin
  describe "#find_all", vcr: true do
    subject { client.credit_card_transactions.find_all(entity_id, credit_card_id) }

    context "when success" do
      it "returns all credit_card_transactions" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardTransactionCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::CreditCardTransaction)
        expect(subject.collection.first.id).to eq(1503930)
        expect(subject.collection.size).to eq(1)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_card_transactions.find_all(entity_id, credit_card_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=end
  describe "#find", vcr: true do
    context "when success" do
      subject { client.credit_card_transactions.find(entity_id, credit_card_id, 314140) }

      it "returns a find credit_card_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardTransaction)
        expect(subject.amount).to eq(-20)
        expect(subject.category_id).to eq(532314)
        expect(subject.classification_center_id).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.credit_card_invoice_id).to be_nil
        expect(subject.description).to eq("Almoço")
        expect(subject.document).to eq("")
        expect(subject.excel_import_id).to be_nil
        expect(subject.financial_account_id).to be_nil
        expect(subject.id).to eq(314140)
        expect(subject.indexed_at).to be_nil
        expect(subject.invoice_payment).to be_nil
        expect(subject.moved).to be_nil
        expect(subject.observation).to eq("")
        expect(subject.occurred_at).to eq(DateTime.parse("2015-11-16"))
        expect(subject.person_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.type).to be_nil
        expect(subject.updated_at).to be_nil
        expect(subject.links).to eq(
          [
            {
              "rel"=>"self",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/credit_cards/43/transactions/314140",
              "method"=>"get"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_card_transactions.find(entity_id, credit_card_id, 314140) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        credit_card_transaction: {
          amount: 199.99,
          occurred_at: "2013-04-20"
        }
      }
    end

    context "when success" do
      subject { client.credit_card_transactions.create(entity_id, credit_card_id, params) }

      it "returns a created credit_card_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardTransaction)
        expect(subject.amount).to eq(199.99)
        expect(subject.category_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.credit_card_invoice_id).to be_nil
        expect(subject.description).to be_nil
        expect(subject.document).to be_nil
        expect(subject.excel_import_id).to be_nil
        expect(subject.financial_account_id).to be_nil
        expect(subject.id).to eq(314141)
        expect(subject.indexed_at).to be_nil
        expect(subject.invoice_payment).to be_nil
        expect(subject.moved).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.occurred_at).to eq(DateTime.parse("2013-04-20"))
        expect(subject.person_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.type).to be_nil
        expect(subject.updated_at).to be_nil
        expect(subject.links).to eq(
          [
            {
              "rel"=>"self",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/credit_cards/43/transactions/314141",
              "method"=>"get"
            }
          ]
        )
      end
    end

    context "when is parceled" do
      subject do
        client.credit_card_transactions.create(
          entity_id,
          credit_card_id,
          {
            credit_card_transaction: {
              amount: 199.99,
              occurred_at: "2013-04-20",
              number_of_parcels: 5
            }
          }
        )
      end

      it "returns a created credit_card_transaction with all links" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardTransaction)
        expect(subject.amount).to eq(199.99)
        expect(subject.category_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.credit_card_invoice_id).to be_nil
        expect(subject.description).to be_nil
        expect(subject.document).to be_nil
        expect(subject.excel_import_id).to be_nil
        expect(subject.financial_account_id).to be_nil
        expect(subject.id).to eq(314143)
        expect(subject.indexed_at).to be_nil
        expect(subject.invoice_payment).to be_nil
        expect(subject.moved).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.occurred_at).to eq(DateTime.parse("2013-04-20"))
        expect(subject.person_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.type).to be_nil
        expect(subject.updated_at).to be_nil
        expect(subject.links).to eq(
          [
            {
              "rel"=>"self",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/credit_cards/43/transactions/314143",
              "method"=>"get"
            },
            {
              "rel"=>"next",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/credit_cards/43/transactions/314144",
              "method"=>"get"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_card_transactions.create(entity_id, credit_card_id, params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        credit_card_transaction: {
          observation: "This is an observation"
        }
      }
    end

    context "when success" do
      subject { client.credit_card_transactions.update(entity_id, credit_card_id, 314140, params) }

      it "returns a updated credit_card_transaction" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardTransaction)
        expect(subject.amount).to eq(-20)
        expect(subject.category_id).to eq(532314)
        expect(subject.classification_center_id).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.credit_card_invoice_id).to be_nil
        expect(subject.description).to eq("Almoço")
        expect(subject.document).to eq("")
        expect(subject.excel_import_id).to be_nil
        expect(subject.financial_account_id).to be_nil
        expect(subject.id).to eq(314140)
        expect(subject.indexed_at).to be_nil
        expect(subject.invoice_payment).to be_nil
        expect(subject.moved).to be_nil
        expect(subject.observation).to eq("This is an observation")
        expect(subject.occurred_at).to eq(DateTime.parse("2015-11-16"))
        expect(subject.person_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.type).to be_nil
        expect(subject.updated_at).to be_nil
        expect(subject.links).to eq(
          [
            {
              "rel"=>"self",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/credit_cards/43/transactions/314140",
              "method"=>"get"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_card_transactions.update(entity_id, credit_card_id, 314140, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.credit_card_transactions.destroy(entity_id, credit_card_id, 314140) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_card_transactions.destroy(entity_id, credit_card_id, 314140) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

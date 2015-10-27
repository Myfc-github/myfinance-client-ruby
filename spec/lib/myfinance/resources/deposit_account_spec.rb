require "spec_helper"

describe Myfinance::Resources::DepositAccount do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.deposit_accounts.find_all(entity_id) }

    context "when success" do
      it "returns all deposit_accounts" do
        expect(subject.class).to eq(Myfinance::Entities::DepositAccountCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::DepositAccount)
        expect(subject.collection.first.id).to eq(14268)
        expect(subject.collection.size).to eq(1)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.deposit_accounts.find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.deposit_accounts.find(entity_id, 14268) }

      it "returns a find_all of orders" do
        expect(subject.class).to eq(Myfinance::Entities::DepositAccount)
        expect(subject.entity_id).to eq(3798)
        expect(subject.id).to eq(14268)
        expect(subject.archived_at).to be_nil
        expect(subject.bank_account_id).to be_nil
        expect(subject.description).to be_nil
        expect(subject.initial_balance).to be_nil
        expect(subject.last_transaction_date).to be_nil
        expect(subject.currency_id).to eq(1)
        expect(subject.deposit_account_type_id).to eq(2)
        expect(subject.force_destroy).to be_falsy
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.name).to eq("Carteira")
        expect(subject.sync_response).to eq({})
        expect(subject.calculated_balance).to eq(0.0)
        expect(subject.logo_image_url).to eq("logos/logo-money-account.png")
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/deposit_accounts/14268",
              "method" => "get"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.deposit_accounts.find(entity_id, 14268) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        deposit_account: {
          name: "Caixa Pequeno",
          currency_id: 1,
          deposit_account_type_id: 2,
          entity_id: entity_id
        }
      }
    end

    context "when success" do
      subject { client.deposit_accounts.create(entity_id, params) }

      it "returns a created entity" do
        expect(subject.class).to eq(Myfinance::Entities::DepositAccount)
        expect(subject.id).to eq(14447)
        expect(subject.currency_id).to eq(1)
        expect(subject.name).to eq("Caixa Pequeno")
        expect(subject.entity_id).to eq(3798)
        expect(subject.deposit_account_type_id).to eq(2)
        expect(subject.archived_at).to be_nil
        expect(subject.bank_account_id).to be_nil
        expect(subject.description).to be_nil
        expect(subject.initial_balance).to be_nil
        expect(subject.last_transaction_date).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-10-27T10:59:54-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-27T10:59:54-02:00"))
        expect(subject.force_destroy).to be_falsy
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.sync_response).to eq({})
        expect(subject.calculated_balance).to eq(0.0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.deposit_accounts.create(entity_id, params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        deposit_account: {
          name: "Caixa"
        }
      }
    end

    context "when success" do
      subject { client.deposit_accounts.update(entity_id, 14447, params) }

      it "returns a updated entity" do
        expect(subject.class).to eq(Myfinance::Entities::DepositAccount)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.deposit_accounts.update(entity_id, 14447, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.deposit_accounts.destroy(entity_id, 14447) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.deposit_accounts.destroy(entity_id, 14447) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

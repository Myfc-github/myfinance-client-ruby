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
      subject { client.deposit_accounts .find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

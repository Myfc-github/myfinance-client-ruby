require "spec_helper"

describe Myfinance::Resources::CreditCard do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.credit_cards.find_all(entity_id) }

    context "when success" do
      it "returns all credit_cards" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::CreditCard)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_cards.find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.credit_cards.find(entity_id, 42) }

      it "returns a find_all of credit_cards" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_cards.find(entity_id, 42) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=begin
  describe "#create", vcr: true do
    let(:params) do
      {
        credit_card: {
          name: "Caixa Pequeno",
          currency_id: 1,
          credit_card_type_id: 2,
          entity_id: entity_id
        }
      }
    end

    context "when success" do
      subject { client.credit_cards.create(entity_id, params) }

      it "returns a created credit_card" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_cards.create(entity_id, params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        credit_card: {
          name: "Caixa"
        }
      }
    end

    context "when success" do
      subject { client.credit_cards.update(entity_id, 14447, params) }

      it "returns a updated credit_card" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_cards.update(entity_id, 14447, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.credit_cards.destroy(entity_id, 14447) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.credit_cards.destroy(entity_id, 14447) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=end
end

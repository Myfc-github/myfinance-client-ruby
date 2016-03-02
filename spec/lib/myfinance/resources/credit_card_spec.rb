require "spec_helper"

describe Myfinance::Resources::CreditCard do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.credit_cards.find_all(entity_id) }

    context "when success" do
      it "returns all credit_cards" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCardCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::CreditCard)
        expect(subject.collection.first.id).to eq(42)
        expect(subject.collection.first.name).to eq("Visa")
        expect(subject.collection.first.flag).to eq("Visa")
        expect(subject.collection.first.closing_day).to eq(21)
        expect(subject.collection.first.expiration_day).to eq(1)
        expect(subject.collection.first.balance).to eq(0.0)
        expect(subject.collection.first.entity_id).to eq(3798)
        expect(subject.collection.first.category_id).to be_nil
        expect(subject.collection.first.person_id).to be_nil
        expect(subject.collection.first.classification_center_id).to be_nil
        expect(subject.collection.first.observation).to eq("")
        expect(subject.collection.first.archived_at).to be_nil
        expect(subject.collection.first.flag_image_url).to eq("https://dbv9lf0nkg7d3.cloudfront.net/assets/logos/logo-creditcard-visa-6757228292690c5f271966ba521f91be.png")
        expect(subject.collection.first.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/credit_cards/42",
              "method" => "get"
            }
          ]
        )
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

      it "returns a find credit_card" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
        expect(subject.id).to eq(42)
        expect(subject.name).to eq("Visa")
        expect(subject.flag).to eq("Visa")
        expect(subject.closing_day).to eq(21)
        expect(subject.expiration_day).to eq(1)
        expect(subject.balance).to eq(0.0)
        expect(subject.entity_id).to eq(3798)
        expect(subject.category_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.observation).to eq("")
        expect(subject.archived_at).to be_nil
        expect(subject.flag_image_url).to eq("https://dbv9lf0nkg7d3.cloudfront.net/assets/logos/logo-creditcard-visa-6757228292690c5f271966ba521f91be.png")
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/credit_cards/42",
              "method" => "get"
            }
          ]
        )
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

  describe "#create", vcr: true do
    let(:params) do
      {
        credit_card: {
          "name" => "Cartão 1",
          "flag" => "MasterCard",
          "closing_day" => 20,
          "expiration_day" => 02
        }
      }
    end

    context "when success" do
      subject { client.credit_cards.create(entity_id, params) }

      it "returns a created credit_card" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
        expect(subject.id).to eq(44)
        expect(subject.name).to eq("Cartão 1")
        expect(subject.flag).to eq("MasterCard")
        expect(subject.closing_day).to eq(20)
        expect(subject.expiration_day).to eq(2)
        expect(subject.balance).to eq(0.0)
        expect(subject.entity_id).to eq(3798)
        expect(subject.category_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.archived_at).to be_nil
        expect(subject.flag_image_url).to eq("https://dbv9lf0nkg7d3.cloudfront.net/assets/logos/logo-creditcard-mastercard-83e2f258255d0900a595e5c447f9114c.png")
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/credit_cards/44",
              "method" => "get"
            }
          ]
        )
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
          name: "Visa Modificado"
        }
      }
    end

    context "when success" do
      subject { client.credit_cards.update(entity_id, 42, params) }

      it "returns a updated credit_card" do
        expect(subject.class).to eq(Myfinance::Entities::CreditCard)
        expect(subject.id).to eq(42)
        expect(subject.name).to eq("Visa Modificado")
        expect(subject.flag).to eq("Visa")
        expect(subject.closing_day).to eq(21)
        expect(subject.expiration_day).to eq(1)
        expect(subject.balance).to eq(0.0)
        expect(subject.entity_id).to eq(3798)
        expect(subject.category_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.observation).to eq("")
        expect(subject.archived_at).to be_nil
        expect(subject.flag_image_url).to eq("https://dbv9lf0nkg7d3.cloudfront.net/assets/logos/logo-creditcard-visa-6757228292690c5f271966ba521f91be.png")
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/credit_cards/42",
              "method" => "get"
            }
          ]
        )
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
      subject { client.credit_cards.destroy(entity_id, 42) }

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
end

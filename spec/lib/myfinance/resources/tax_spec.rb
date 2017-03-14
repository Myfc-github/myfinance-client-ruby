require "spec_helper"

describe Myfinance::Resources::Tax, vcr: true do
  let(:klass) { Myfinance::Entities::Tax }

  let(:collection) do
    Myfinance::Entities::TaxCollection
  end

  describe "#find_all" do
    context "when success" do
      subject { client.taxes.find_all }

      it "show all taxes" do
        expect(subject).to be_a(collection)
        expect(subject.collection.first).to be_a(klass)
        expect(subject.collection.first.name).to eq("Outros")
      end
    end

    context "when error" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.taxes.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "when success" do
      subject { client.taxes.find(1) }

      it "show a tax successfully" do
        expect(subject).to be_a(klass)
        expect(subject.name).to eq("Outros")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.taxes.find(42424242)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end

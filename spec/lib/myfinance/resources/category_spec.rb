require "spec_helper"

describe Myfinance::Resources::Category do
  describe "#find_all", vcr: true do
    context "when success" do
      subject { client.categories.find_all }

      it "returns a find_all of categories" do
        expect(subject.class).to eq(Myfinance::Entities::CategoryCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::Category)
        expect(subject.collection.length).to eq(139)
        expect(subject.collection.first.account_id).to eq(3613)
        expect(subject.collection.first.cost).to be_truthy
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-07-29T11:04:50-03:00"))
        expect(subject.collection.first.excel_import_id).to be_nil
        expect(subject.collection.first.force_destroy).to be_falsy
        expect(subject.collection.first.full_name).to eq("Alimentação")
        expect(subject.collection.first.guid).to be_nil
        expect(subject.collection.first.id).to eq(532314)
        expect(subject.collection.first.imported_from_sync).to be_falsy
        expect(subject.collection.first.interested_users_ids).to eq([])
        expect(subject.collection.first.modified_by_sync).to be_falsy
        expect(subject.collection.first.name).to eq("Alimentação")
        expect(subject.collection.first.parent_id).to be_nil
        expect(subject.collection.first.revenue).to be_truthy
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-07-29T11:04:50-03:00"))
        expect(subject.collection.first.use_count).to eq(0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.categories.find_all }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.categories.find(536751) }

      it "returns a find of category" do
        expect(subject.class).to eq(Myfinance::Entities::Category)
        expect(subject.id).to eq(536751)
        expect(subject.account_id).to be_nil
        expect(subject.cost).to be_truthy
        expect(subject.created_at).to eq(DateTime.parse("2015-11-12T17:45:35-02:00"))
        expect(subject.excel_import_id).to be_nil
        expect(subject.force_destroy).to be_falsy
        expect(subject.full_name).to eq("Clube")
        expect(subject.guid).to be_nil
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.interested_users_ids).to eq([3691])
        expect(subject.modified_by_sync).to be_falsy
        expect(subject.name).to eq("Clube")
        expect(subject.parent_id).to be_nil
        expect(subject.revenue).to be_truthy
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-12T17:45:35-02:00"))
        expect(subject.use_count).to eq(0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.categories.find(536751) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=begin
  describe "#create", vcr: true do
    let(:params) do
      {
        person: {
          address: "Rua Tal",
          address_number: "42",
          city: "Rio de Janeiro",
          complement: "sala 1234",
          country: "Brasil",
          customer: true,
          email: "cliente@fulano.com",
          federation_subscription_number: "27.206.831/0001-70",
          name: "Fulano de Tal",
          neighborhood: "Centro",
          note: "Notas sobre este cliente...",
          person_type: "JuridicalCategory",
          phone: "(21) 5555-1234",
          site: "http://www.fulano.com",
          state: "RJ",
          supplier: false,
          zip_code: "22290-080"
        }
      }
    end

    context "when success" do
      subject { client.categories.create(params) }

      it "returns a created person" do
        expect(subject.class).to eq(Myfinance::Entities::Category)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.categories.create(params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=end
  describe "#update", vcr: true do
    let(:params) do
      {
        category: {
          name: "CLube Modificado"
        }
      }
    end

    context "when success" do
      subject { client.categories.update(536751, params) }

      it "returns a updated category" do
        expect(subject.class).to eq(Myfinance::Entities::Category)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.categories.update(536751, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=begin
  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.categories.destroy(536751) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.categories.destroy(536751) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
=end
end

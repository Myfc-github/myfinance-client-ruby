require "spec_helper"

describe Myfinance::Resources::Person do
  describe "#find_all", vcr: true do
    context "when success" do
      subject { client.people.find_all }

      it "returns a find_all of people" do
        expect(subject.class).to eq(Myfinance::Entities::PersonCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::Person)
        expect(subject.collection.length).to eq(1)
        expect(subject.collection.first.id).to eq(199424)
        expect(subject.collection.first.account_id).to eq(3613)
        expect(subject.collection.first.address).to eq("")
        expect(subject.collection.first.address_number).to eq("")
        expect(subject.collection.first.city).to eq("")
        expect(subject.collection.first.complement).to eq("")
        expect(subject.collection.first.country).to eq("")
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-11-12T14:34:37-02:00"))
        expect(subject.collection.first.customer).to eq(true)
        expect(subject.collection.first.email).to eq("")
        expect(subject.collection.first.excel_import_id).to be_nil
        expect(subject.collection.first.febraban_favored_code).to be_nil
        expect(subject.collection.first.febraban_name).to be_nil
        expect(subject.collection.first.federation_subscription_number).to eq("42.308.611/0001-41")
        expect(subject.collection.first.federation_subscription_number_only_numbers).to eq("42308611000141")
        expect(subject.collection.first.federation_subscription_type_id).to be_nil
        expect(subject.collection.first.force_destroy).to eq(false)
        expect(subject.collection.first.guid).to be_nil
        expect(subject.collection.first.imported_from_sync).to eq(false)
        expect(subject.collection.first.interested_users_ids).to eq([3691])
        expect(subject.collection.first.modified_by_sync).to eq(false)
        expect(subject.collection.first.name).to eq("Myfreecomm")
        expect(subject.collection.first.neighborhood).to eq("")
        expect(subject.collection.first.note).to eq("")
        expect(subject.collection.first.person_type).to eq("JuridicalPerson")
        expect(subject.collection.first.phone).to eq("")
        expect(subject.collection.first.site).to eq("")
        expect(subject.collection.first.state).to eq("")
        expect(subject.collection.first.supplier).to eq(true)
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-11-12T14:34:37-02:00"))
        expect(subject.collection.first.use_count).to eq(0)
        expect(subject.collection.first.zip_code).to eq("")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.people.find_all }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.people.find(199424) }

      it "returns a find_all of people" do
        expect(subject.class).to eq(Myfinance::Entities::Person)
        expect(subject.id).to eq(199424)
        expect(subject.address).to eq("")
        expect(subject.address_number).to eq("")
        expect(subject.city).to eq("")
        expect(subject.complement).to eq("")
        expect(subject.country).to eq("")
        expect(subject.created_at).to eq(DateTime.parse("2015-11-12T14:34:37-02:00"))
        expect(subject.customer).to eq(true)
        expect(subject.email).to eq("")
        expect(subject.excel_import_id).to be_nil
        expect(subject.febraban_favored_code).to be_nil
        expect(subject.febraban_name).to be_nil
        expect(subject.federation_subscription_number).to eq("42.308.611/0001-41")
        expect(subject.federation_subscription_number_only_numbers).to eq("42308611000141")
        expect(subject.federation_subscription_type_id).to be_nil
        expect(subject.force_destroy).to eq(false)
        expect(subject.guid).to be_nil
        expect(subject.imported_from_sync).to eq(false)
        expect(subject.interested_users_ids).to eq([3691])
        expect(subject.modified_by_sync).to eq(false)
        expect(subject.name).to eq("Myfreecomm")
        expect(subject.neighborhood).to eq("")
        expect(subject.note).to eq("")
        expect(subject.person_type).to eq("JuridicalPerson")
        expect(subject.phone).to eq("")
        expect(subject.site).to eq("")
        expect(subject.state).to eq("")
        expect(subject.supplier).to eq(true)
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-12T14:34:37-02:00"))
        expect(subject.use_count).to eq(0)
        expect(subject.zip_code).to eq("")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.people.find(199424) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

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
          person_type: "JuridicalPerson",
          phone: "(21) 5555-1234",
          site: "http://www.fulano.com",
          state: "RJ",
          supplier: false,
          zip_code: "22290-080"
        }
      }
    end

    context "when success" do
      subject { client.people.create(params) }

      it "returns a created person" do
        expect(subject.class).to eq(Myfinance::Entities::Person)
        expect(subject.id).to eq(199425)
        expect(subject.address).to eq("Rua Tal")
        expect(subject.address_number).to eq("42")
        expect(subject.city).to eq("Rio de Janeiro")
        expect(subject.complement).to eq("sala 1234")
        expect(subject.country).to eq("Brasil")
        expect(subject.created_at).to eq(DateTime.parse("2015-11-12T16:12:55-02:00"))
        expect(subject.customer).to eq(true)
        expect(subject.email).to eq("cliente@fulano.com")
        expect(subject.excel_import_id).to be_nil
        expect(subject.febraban_favored_code).to be_nil
        expect(subject.febraban_name).to be_nil
        expect(subject.federation_subscription_number).to eq("27.206.831/0001-70")
        expect(subject.federation_subscription_number_only_numbers).to eq("27206831000170")
        expect(subject.federation_subscription_type_id).to be_nil
        expect(subject.force_destroy).to eq(false)
        expect(subject.guid).to be_nil
        expect(subject.imported_from_sync).to eq(false)
        expect(subject.interested_users_ids).to eq([3703])
        expect(subject.modified_by_sync).to eq(false)
        expect(subject.name).to eq("Fulano de Tal")
        expect(subject.neighborhood).to eq("Centro")
        expect(subject.note).to eq("Notas sobre este cliente...")
        expect(subject.person_type).to eq("JuridicalPerson")
        expect(subject.phone).to eq("(21) 5555-1234")
        expect(subject.site).to eq("http://www.fulano.com")
        expect(subject.state).to eq("RJ")
        expect(subject.supplier).to eq(false)
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-12T16:12:55-02:00"))
        expect(subject.use_count).to eq(0)
        expect(subject.zip_code).to eq("22290-080")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.people.create(params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        person: {
          name: "Fulano de Tal Modificado"
        }
      }
    end

    context "when success" do
      subject { client.people.update(199425, params) }

      it "returns a updated person" do
        expect(subject.class).to eq(Myfinance::Entities::Person)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.people.update(199425, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.people.destroy(199425) }

      it "returns a empty body with code 202" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.people.destroy(199425) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

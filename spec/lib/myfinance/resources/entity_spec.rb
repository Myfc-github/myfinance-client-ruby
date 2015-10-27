require "spec_helper"

describe Myfinance::Resources::Entity do
  describe "#find_all", vcr: true do
    context "when success" do
      subject { client.entities.find_all }

      it "returns a find_all of orders" do
        expect(subject.class).to eq(Myfinance::Entities::EntityCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::Entity)
        expect(subject.collection.first.id).to eq(3798)
        expect(subject.collection.first.name).to eq("Minhas Finanças")
        expect(subject.collection.first.account_id).to eq(3613)
        expect(subject.collection.first.charging_uuid).to be_nil
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-07-29T11:04:45-03:00"))
        expect(subject.collection.first.default_in_menu).to be_truthy
        expect(subject.collection.first.deleted_at).to be_nil
        expect(subject.collection.first.federation_subscription_number).to eq("")
        expect(subject.collection.first.imported_from_sync_at).to be_nil
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-07-29T14:30:36-03:00"))
        expect(subject.collection.count).to eq(1)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.find_all }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.entities.find(3798) }

      it "returns a find_all of orders" do
        expect(subject.class).to eq(Myfinance::Entities::Entity)
        expect(subject.id).to eq(3798)
        expect(subject.name).to eq("Minhas Finanças")
        expect(subject.account_id).to eq(3613)
        expect(subject.charging_uuid).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-07-29T11:04:45-03:00"))
        expect(subject.default_in_menu).to be_truthy
        expect(subject.deleted_at).to be_nil
        expect(subject.federation_subscription_number).to eq("")
        expect(subject.imported_from_sync_at).to be_nil
        expect(subject.updated_at).to eq(DateTime.parse("2015-07-29T14:30:36-03:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.find(3798) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#get_new", vcr: true do
    context "when success" do
      subject { client.entities.get_new }

      it "returns empty entity" do
        expect(subject.class).to eq(Myfinance::Entities::Entity)
        expect(subject.id).to be_nil
        expect(subject.name).to be_nil
        expect(subject.account_id).to eq(3613)
        expect(subject.charging_uuid).to be_nil
        expect(subject.created_at).to be_nil
        expect(subject.default_in_menu).to be_falsy
        expect(subject.deleted_at).to be_nil
        expect(subject.federation_subscription_number).to be_nil
        expect(subject.imported_from_sync_at).to be_nil
        expect(subject.updated_at).to be_nil
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.get_new }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        entity: {
          name: "Finanças"
        }
      }
    end

    context "when success" do
      subject { client.entities.create(params) }

      it "returns a created entity" do
        expect(subject.class).to eq(Myfinance::Entities::Entity)
        expect(subject.id).to eq(3828)
        expect(subject.name).to eq("Finanças")
        expect(subject.account_id).to eq(3613)
        expect(subject.charging_uuid).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-10-15T16:11:08-03:00"))
        expect(subject.default_in_menu).to be_falsy
        expect(subject.deleted_at).to be_nil
        expect(subject.federation_subscription_number).to be_nil
        expect(subject.imported_from_sync_at).to be_nil
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-15T16:11:08-03:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.create(params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        entity: {
          name: "Finanças 2"
        }
      }
    end

    context "when success" do
      subject { client.entities.update(3828, params) }

      it "returns a updated entity" do
        expect(subject.class).to eq(Myfinance::Entities::Entity)
        expect(subject.id).to eq(3828)
        expect(subject.name).to eq("Finanças 2")
        expect(subject.account_id).to eq(3613)
        expect(subject.charging_uuid).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-10-15T16:11:08-03:00"))
        expect(subject.default_in_menu).to be_falsy
        expect(subject.deleted_at).to be_nil
        expect(subject.federation_subscription_number).to be_nil
        expect(subject.imported_from_sync_at).to be_nil
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-15T16:11:08-03:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.update(3828, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.entities.destroy(3828) }

      it "returns a empty body with code 202" do
        expect(subject).to eq(202)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.entities.destroy(3828) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when last one entity" do
      it "does not delete" do
        entity = client.entities.destroy(3800)
        expect(entity).to eq(202)

        expect { client.entities.destroy(3798) }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

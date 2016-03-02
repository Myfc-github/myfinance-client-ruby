require "spec_helper"

describe Myfinance::Resources::ClassificationCenter do
  describe "#find_all", vcr: true do
    context "when success" do
      subject { client.classification_centers.find_all }

      it "returns a find_all of classification_centers" do
        expect(subject.class).to eq(Myfinance::Entities::ClassificationCenterCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::ClassificationCenter)
        expect(subject.collection.first.cost_center).to be_truthy
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-11-13T16:28:21-02:00"))
        expect(subject.collection.first.entity_id).to eq(3798)
        expect(subject.collection.first.excel_import_id).to be_nil
        expect(subject.collection.first.guid).to be_nil
        expect(subject.collection.first.id).to eq(17981)
        expect(subject.collection.first.imported_from_sync).to be_falsy
        expect(subject.collection.first.modified_by_sync).to be_falsy
        expect(subject.collection.first.name).to eq("Classificador")
        expect(subject.collection.first.revenue_center).to be_truthy
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-11-13T16:28:21-02:00"))
        expect(subject.collection.first.use_count).to eq(0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.classification_centers.find_all }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.classification_centers.find(17981) }

      it "returns a find of classification_centers" do
        expect(subject.class).to eq(Myfinance::Entities::ClassificationCenter)
        expect(subject.cost_center).to be_truthy
        expect(subject.created_at).to eq(DateTime.parse("2015-11-13T16:28:21-02:00"))
        expect(subject.entity_id).to eq(3798)
        expect(subject.excel_import_id).to be_nil
        expect(subject.guid).to be_nil
        expect(subject.id).to eq(17981)
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.modified_by_sync).to be_falsy
        expect(subject.name).to eq("Classificador")
        expect(subject.revenue_center).to be_truthy
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-13T16:28:21-02:00"))
        expect(subject.use_count).to eq(0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.classification_centers.find(17981) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        classification_center: {
          name: "Centro de Custo Tal",
          entity_id: 3798,
          cost_center: true,
          revenue_center: false
        }
      }
    end

    context "when success" do
      subject { client.classification_centers.create(params) }

      it "returns a created classification_center" do
        expect(subject.class).to eq(Myfinance::Entities::ClassificationCenter)
        expect(subject.cost_center).to be_truthy
        expect(subject.created_at).to eq(DateTime.parse("2015-11-13T16:40:42-02:00"))
        expect(subject.entity_id).to eq(3798)
        expect(subject.excel_import_id).to be_nil
        expect(subject.guid).to be_nil
        expect(subject.id).to eq(17982)
        expect(subject.imported_from_sync).to be_falsy
        expect(subject.modified_by_sync).to be_falsy
        expect(subject.name).to eq("Centro de Custo Tal")
        expect(subject.revenue_center).to be_falsy
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-13T16:40:42-02:00"))
        expect(subject.use_count).to eq(0)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.classification_centers.create(params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#update", vcr: true do
    let(:params) do
      {
        classification_center: {
          name: "Classificadores Modificado"
        }
      }
    end

    context "when success" do
      subject { client.classification_centers.update(17981, params) }

      it "returns a updated classification_center" do
        expect(subject.class).to eq(Myfinance::Entities::ClassificationCenter)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.classification_centers.update(17981, params) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    context "when success" do
      subject { client.classification_centers.destroy(17981) }

      it "returns a empty body with code 200" do
        expect(subject).to eq(200)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.classification_centers.destroy(17981) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

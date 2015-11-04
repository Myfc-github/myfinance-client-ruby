require "spec_helper"

describe Myfinance::Resources::Attachment do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.attachments.find_all(entity_id) }

    context "when success" do
      it "returns all attachments" do
        expect(subject.class).to eq(Myfinance::Entities::AttachmentCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::Attachment)
        expect(subject.collection.first.id).to eq(1304)
        expect(subject.collection.size).to eq(1)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.attachments.find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#find", vcr: true do
    context "when success" do
      subject { client.attachments.find(entity_id, 1304) }

      it "returns a find of attachment" do
        expect(subject.class).to eq(Myfinance::Entities::Attachment)
        expect(subject.id).to eq(1304)
        expect(subject.attachables).to eq([])
        expect(subject.attachment_content_type).to eq("image/png")
        # expect(subject.attachment_file_name).to eq("Captura_de_tela_2011-08-10_às_13.32.17.png")
        expect(subject.attachment_file_size).to eq(3288)
        expect(subject.created_at).to eq(DateTime.parse("2015-11-04T16:05:16-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-04T16:05:16-02:00"))
        expect(subject.download_url).to eq("https://sandbox.myfinance.com.br/entities/3798/attachments/1304/download")
        expect(subject.entity_id).to eq(3798)
        expect(subject.title).to eq("Captura")
        expect(subject.links).to eq(
          [
            {
              "rel"=>"self",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/attachments/1304",
              "method"=>"get"
            },
            {
              "rel"=>"download",
              "href"=>"https://sandbox.myfinance.com.br/entities/3798/attachments/1304/download",
              "method"=>"get"
            }
          ]
        )
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.attachments.find(entity_id, 1304) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

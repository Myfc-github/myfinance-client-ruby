require "spec_helper"

describe Myfinance::Resources::BankStatement do
  let(:entity_id) { 3798 }
  let(:deposit_account_id) { 14268 }

  describe "#find", vcr: true do
    context "when success" do
      subject { client.bank_statements.find(entity_id, deposit_account_id, 18212) }

      it "returns a find_all of bank_statements" do
        expect(subject.class).to eq(Myfinance::Entities::BankStatement)
        expect(subject.amount_zero_items_ignored_count).to eq(0)
        expect(subject.created_at).to eq(DateTime.parse("2015-11-12T09:58:35-02:00"))
        expect(subject.deposit_account_id).to eq(14268)
        expect(subject.event_id).to eq(15424)
        expect(subject.file_content_type).to eq("application/octet-stream")
        expect(subject.file_file_name).to eq("ArquivoFinanceiro.ofx")
        expect(subject.file_file_size).to eq(1021)
        expect(subject.file_updated_at).to eq(DateTime.parse("2015-11-12T09:58:35-02:00"))
        expect(subject.future_items_ignored_count).to eq(0)
        expect(subject.id).to eq(18212)
        expect(subject.invalid_date_items_ignored_count).to eq(0)
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-12T09:58:35-02:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.bank_statements.find(entity_id, deposit_account_id, 18212) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) do
      {
        bank_statement: {
          deposit_account_id: deposit_account_id.to_s,
          file: File.open("spec/fixtures/BB_OFX.ofx", "r")
        }
      }
    end

    context "when success" do
      subject { client.bank_statements.create(entity_id, deposit_account_id, params) }

      it "returns a created bank_statement" do
        expect(subject.class).to eq(Myfinance::Entities::BankStatementImport)
        expect(subject.url).to eq("/entities/3798/deposit_accounts/14268/bank_statements/18213")
        expect(subject.parsed_body).to eq({})
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.bank_statements.create(entity_id, deposit_account_id, params) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

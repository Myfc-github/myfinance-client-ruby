require "spec_helper"

describe Myfinance::Resources::PayableAccount do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.payable_accounts.find_all(entity_id) }

    context "when success" do
      it "returns all payable_accounts" do
        expect(subject.class).to eq(Myfinance::Entities::PayableAccountCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::PayableAccount)
        expect(subject.collection.first.id).to eq(1225322)
        expect(subject.collection.size).to eq(50)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.payable_accounts.find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#get_new", vcr: true do
    context "when success" do
      subject { client.payable_accounts.get_new(entity_id) }

      it "returns empty payable_account" do
        expect(subject.class).to eq(Myfinance::Entities::PayableAccount)
        expect(subject.id).to be_nil
        expect(subject.due_date).to eq(Date.new(2015, 10, 20))
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.occurred_at).to be_nil
        expect(subject.amount).to be_nil
        expect(subject.ticket_amount).to be_nil
        expect(subject.interest_amount).to be_nil
        expect(subject.discount_amount).to be_nil
        expect(subject.total_amount).to be_nil
        expect(subject.description).to be_nil
        expect(subject.document).to be_nil
        expect(subject.document_emission_date).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.remind).to be_falsy
        expect(subject.reminded_at).to be_nil
        expect(subject.income_tax_relevant).to be_falsy
        expect(subject.category_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.expected_deposit_account_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.recurrent).to be_falsy
        expect(subject.parcelled).to be_falsy
        expect(subject.recurrence_period).to be_nil
        expect(subject.number_of_parcels).to be_nil
        expect(subject.current_parcel).to be_nil
        expect(subject.competency_month).to be_nil
        expect(subject.financial_account_taxes_attributes).to be_empty
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.payable_accounts.get_new(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) { { due_date: '2015-08-15', amount: 150.99 } }
    subject { client.payable_accounts.create(entity_id, params) }

    context "with success" do
      it "creates a new object" do
        expect(subject.id).to eq(1235050)
        expect(subject.due_date).to eq(Date.new(2015, 8, 15))
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.status).to eq(1)
        expect(subject.status_name).to eq('unpaid')
        expect(subject.occurred_at).to be_nil
        expect(subject.amount).to eq(150.99)
        expect(subject.ticket_amount).to be_nil
        expect(subject.interest_amount).to be_nil
        expect(subject.discount_amount).to be_nil
        expect(subject.total_amount).to be_nil
        expect(subject.description).to be_nil
        expect(subject.document).to be_nil
        expect(subject.document_emission_date).to be_nil
        expect(subject.observation).to be_nil
        expect(subject.remind).to be_falsy
        expect(subject.reminded_at).to be_nil
        expect(subject.income_tax_relevant).to be_falsy
        expect(subject.category_id).to be_nil
        expect(subject.classification_center_id).to be_nil
        expect(subject.expected_deposit_account_id).to be_nil
        expect(subject.recurrence_id).to be_nil
        expect(subject.person_id).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-08-13T16:24:47-03:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-08-13T16:24:47-03:00"))
        expect(subject.recurrent).to be_falsy
        expect(subject.parcelled).to be_falsy
        expect(subject.recurrence_period).to be_nil
        expect(subject.number_of_parcels).to be_nil
        expect(subject.current_parcel).to be_nil
        expect(subject.competency_month).to eq("2015-08")
        expect(subject.financial_account_taxes_attributes).to be_empty
      end

      context "when the payable_account has occurred_at value defined" do
        let(:params) { { due_date: '2015-08-01', amount: 150.99, occurred_at: '2015-08-05', total_amount: 150.99 } }

        it "creates a new payable_account as paid" do
          expect(subject.id).to eq(1215632)
          expect(subject.due_date).to eq(Date.new(2015, 8, 1))
          expect(subject.occurred_at).to eq(Date.new(2015, 8, 5))
          expect(subject.amount).to eq(150.99)
          expect(subject.total_amount).to eq(150.99)
          expect(subject.status).to eq(2)
          expect(subject.status_name).to eq('paid')
        end
      end
    end

    context "when any data is invalid" do
      let(:params) { { due_date: '', amount: 150.99 } }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 422, message: "", body: { "competency_month" => ["não pode ser vazio"], "due_date" => ["não é uma data válida"] }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when entity does not exist" do
      subject { client.payable_accounts.create(555, params) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 403, message: "Forbidden", body: {"error" => "Você não tem permissão para acessar este recurso." }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#pay", vcr: true do
    let(:params) { { total_amount: 150.99, occurred_at: '2015-08-05', amount: 150.99 } }
    subject { client.payable_accounts.pay(1215631, entity_id, params) }

    context "with success" do
      it "pays payable account" do
        expect(subject.id).to eq(1215631)
        expect(subject.status).to eq(2)
        expect(subject.status_name).to eq('paid')
        expect(subject.amount).to eq(150.99)
        expect(subject.total_amount).to eq(150.99)
        expect(subject.ticket_amount).to be_nil
        expect(subject.interest_amount).to be_nil
        expect(subject.discount_amount).to be_nil
      end
    end

    context "when any parameter is invalid" do
      let(:params) { { total_amount: nil, occurred_at: '2015-08-05', amount: 150.99 } }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#undo_payment", vcr: true do
    subject { client.payable_accounts.undo_payment(1215631, entity_id) }

    it "undoes receivement of the receivable account" do
      expect(subject.id).to eq(1215631)
      expect(subject.status).to eq(1)
      expect(subject.status_name).to eq('unpaid')
      expect(subject.amount).to eq(150.99)
      expect(subject.total_amount).to be_nil
      expect(subject.ticket_amount).to be_nil
      expect(subject.interest_amount).to be_nil
      expect(subject.discount_amount).to be_nil
    end
  end

  describe "#update", vcr: true do
    subject { client.payable_accounts.update(1235050, entity_id, { amount: 100.00 }) }

    context "when payable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when payable account does not exist" do
      subject { client.payable_accounts.update(9999999, entity_id, { amount: 100.00 }) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    subject { client.payable_accounts.destroy(1215631, entity_id) }

    context "when payable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when payable account does not exist" do
      subject { client.payable_accounts.destroy(1215631099, entity_id) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

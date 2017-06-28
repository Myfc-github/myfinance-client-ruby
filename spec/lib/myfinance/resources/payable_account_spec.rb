require "spec_helper"

describe Myfinance::Resources::PayableAccount do
  let(:entity_id) { 3798 }
  let(:pa_id) { 1235663 }
  let(:page) { 2 }
  let(:url) { subject.response.request.base_url }
  let(:request_error) { Myfinance::RequestError }

  describe "#find_all", vcr: true do
    before :each do
      subject.build
    end
    context "with pagination" do
      subject { client.payable_accounts.find_all(entity_id, page) }

      it "returns 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "returns a PayableAccount collection" do
        expect(subject).to be_a(Myfinance::Entities::PayableAccountCollection)
      end

      it "returns a paginated URL" do
        expect(url).to include("?page=#{page}")
      end

      context "with invalid page" do
        subject { client.payable_accounts.find_all(entity_id, 42424242) }

        it "returns empty collection" do
          expect(subject.collection).to be_empty
        end
      end
    end

    context "without pagination" do
      subject { client.payable_accounts.find_all(entity_id) }

      it "returns 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "returns a PayableAccount collection" do
        expect(subject).to be_a(Myfinance::Entities::PayableAccountCollection)
      end

      it "returns a paginated URL" do
        expect(url).not_to include("?page=#{page}")
      end

      context "with invalid entity id" do
        it "raises 404 not found error" do
          expect { client.payable_accounts.find_all(nil) }.to raise_error(request_error) do |e|
            expect(e.code).to eq(404)
            expect(e.message).to eq("Not Found")
          end
        end
      end
    end
  end

  describe "#find", vcr: true do
    subject { client.payable_accounts.find(entity_id, pa_id) }

    it "returns a PayableAccount" do
      expect(subject).to be_a(Myfinance::Entities::PayableAccount)
    end

    context "with invalid ID" do
      subject { client.payable_accounts.find(nil, nil) }

      it "raises 404 not found error" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
        end
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
        expect(subject.tax_charges_attributes).to be_empty
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

      it "raises request_error" do
        expect { subject }.to raise_error(request_error)
      end

      it "adds information on request error object" do
        body = { "competency_month" => ["não pode ser vazio"], "due_date" => ["não é uma data válida"] }
        expect(request_error).to receive(:new).with(code: 422, message: "", body: body).and_call_original
        expect { subject }.to raise_error(request_error)
      end
    end

    context "when entity does not exist" do
      subject { client.payable_accounts.create(555, params) }

      it "raises request_error" do
        expect { subject }.to raise_error(request_error)
      end

      it "adds information on request error object" do
        body = {"error" => "Você não tem permissão para acessar este recurso." }
        expect(request_error).to receive(:new).with(code: 403, message: "Forbidden", body: body).and_call_original
        expect { subject }.to raise_error(request_error)
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
        expect { subject }.to raise_error(request_error)
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
    subject { client.payable_accounts.update(entity_id, 1235050, { amount: 100.00 }) }

    context "when payable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when payable account does not exist" do
      subject { client.payable_accounts.update(entity_id, 9999999, { amount: 100.00 }) }

      it "raises request error" do
        expect { subject }.to raise_error(request_error)
      end
    end
  end

  describe "#destroy", vcr: true do
    subject { client.payable_accounts.destroy(entity_id, 1215631) }

    context "when payable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when payable account does not exist" do
      subject { client.payable_accounts.destroy(entity_id, 1215631099) }

      it "raises request error" do
        expect { subject }.to raise_error(request_error)
      end
    end
  end

  describe "#destroy_recurrence", vcr: true do
    let(:params) { { due_date: "2015-08-15", amount: 150.99, create_as_recurrent: "annual" } }
    let(:new_pa) { client.payable_accounts.create(entity_id, params) }

    before :each do
      client.payable_accounts.destroy_recurrence(entity_id, new_pa.id)
    end

    it "does not find recurrent payable accounts" do
      expect { client.payable_accounts.find(entity_id, new_pa.id) }.to raise_error(request_error) do |e|
        expect(e.code).to eq(404)
        expect(e.message).to eq("Not Found")
      end

      expect { client.payable_accounts.find(entity_id, new_pa.id + 1) }.to raise_error(request_error) do |e|
        expect(e.code).to eq(404)
        expect(e.message).to eq("Not Found")
      end
    end
  end

  describe "#destroy_many", vcr: true do
    let(:params) { { due_date: "2015-08-15", amount: 150.99 } }
    let(:new_pa) { client.payable_accounts.create(entity_id, params) }
    let(:new_pa2) { client.payable_accounts.create(entity_id, params) }

    before :each do
      client.payable_accounts.destroy_many(entity_id, [new_pa.id, new_pa2.id])
    end

    it "does not find created PayableAccount" do
      expect { client.payable_accounts.find(entity_id, new_pa.id) }.to raise_error(request_error) do |e|
        expect(e.code).to eq(404)
        expect(e.message).to eq("Not Found")
      end
    end
  end
end

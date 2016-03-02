require "spec_helper"

describe Myfinance::Resources::ReceivableAccount do
  let(:entity_id) { 3798 }

  describe "#find_all", vcr: true do
    subject { client.receivable_accounts.find_all(entity_id) }

    context "when success" do
      it "returns all receivable_accounts" do
        expect(subject.class).to eq(Myfinance::Entities::ReceivableAccountCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::ReceivableAccount)
        expect(subject.collection.first.id).to eq(1225324)
        expect(subject.collection.size).to eq(31)
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }
      subject { client.receivable_accounts.find_all(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#get_new", vcr: true do
    context "when success" do
      subject { client.receivable_accounts.get_new(entity_id) }

      it "returns empty receivable_account" do
        expect(subject.class).to eq(Myfinance::Entities::ReceivableAccount)
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
      subject { client.receivable_accounts.get_new(entity_id) }

      it "raises NotFound" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create", vcr: true do
    let(:params) { { due_date: "2015-08-15", amount: 150.99 } }
    subject { client.receivable_accounts.create(entity_id, params) }

    context "with success" do
      it "creates a new object" do
        expect(subject.id).to eq(1235051)
        expect(subject.due_date).to eq(Date.new(2015, 8, 15))
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.status).to eq(1)
        expect(subject.status_name).to eq("unreceived")
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
        expect(subject.created_at).to eq(DateTime.parse("2015-08-13T16:29:06-03:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-08-13T16:29:06-03:00"))
        expect(subject.recurrent).to be_falsy
        expect(subject.parcelled).to be_falsy
        expect(subject.recurrence_period).to be_nil
        expect(subject.number_of_parcels).to be_nil
        expect(subject.current_parcel).to be_nil
        expect(subject.competency_month).to eq("2015-08")
        expect(subject.financial_account_taxes_attributes).to be_empty
      end

      context "when the receivable_account has occurred_at value defined" do
        let(:params) { { due_date: "2015-08-01", amount: 150.99, occurred_at: "2015-08-05", total_amount: 150.99 } }

        it "creates a new receivable_account as paid" do
          expect(subject.id).to eq(1215635)
          expect(subject.due_date).to eq(Date.new(2015, 8, 1))
          expect(subject.occurred_at).to eq(Date.new(2015, 8, 5))
          expect(subject.amount).to eq(150.99)
          expect(subject.total_amount).to eq(150.99)
          expect(subject.status).to eq(2)
          expect(subject.status_name).to eq("received")
        end
      end
    end

    context "when any data is invalid" do
      let(:params) { { due_date: "", amount: 150.99 } }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 422, message: "", body: { "competency_month" => ["não pode ser vazio"], "due_date" => ["não é uma data válida"] }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when entity does not exist" do
      subject { client.receivable_accounts.create(555, params) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 403, message: "Forbidden", body: { "error" => "Você não tem permissão para acessar este recurso." }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#receive", vcr: true do
    let(:params) { { total_amount: 150.99, occurred_at: "2015-08-05", amount: 150.99 } }
    subject { client.receivable_accounts.receive(1215634, entity_id, params) }

    context "with success" do
      it "receives the receivable account" do
        expect(subject.id).to eq(1215634)
        expect(subject.status).to eq(2)
        expect(subject.status_name).to eq("received")
        expect(subject.amount).to eq(150.99)
        expect(subject.total_amount).to eq(150.99)
        expect(subject.ticket_amount).to be_nil
        expect(subject.interest_amount).to be_nil
        expect(subject.discount_amount).to be_nil
      end
    end

    context "when any parameter is invalid" do
      let(:params) { { total_amount: nil, occurred_at: "2015-08-05", amount: 150.99 } }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#undo_receivement", vcr: true do
    subject { client.receivable_accounts.undo_receivement(1215634, entity_id) }

    it "undoes receivement of the receivable account" do
      expect(subject.id).to eq(1215634)
      expect(subject.status).to eq(1)
      expect(subject.status_name).to eq("unreceived")
      expect(subject.amount).to eq(150.99)
      expect(subject.total_amount).to be_nil
      expect(subject.ticket_amount).to be_nil
      expect(subject.interest_amount).to be_nil
      expect(subject.discount_amount).to be_nil
    end
  end

  describe "#update", vcr: true do
    subject { client.receivable_accounts.update(1235051, entity_id, { amount: 100.00 }) }

    context "when payable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when payable account does not exist" do
      subject { client.receivable_accounts.update(9999999, entity_id, { amount: 100.00 }) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    subject { client.receivable_accounts.destroy(1215634, entity_id) }

    context "when receivable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when receivable account does not exist" do
      subject { client.receivable_accounts.destroy(1215631099, entity_id) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create_as_recurrent", vcr: true do
    let(:params) { { due_date: "2015-10-20", amount: 150.99, create_as_recurrent: "monthly" } }
    subject { client.receivable_accounts.create_as_recurrent(entity_id, params) }

    context "with success" do
      it "creates a new object" do
        expect(subject.id).to eq(1298917)
        expect(subject.due_date).to eq(Date.new(2015, 10, 20))
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.status).to eq(1)
        expect(subject.status_name).to eq("unreceived")
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
        expect(subject.recurrence_id).to eq(8831)
        expect(subject.person_id).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-10-20T15:10:44-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-20T15:10:45-02:00"))
        expect(subject.recurrent).to be_truthy
        expect(subject.parcelled).to be_falsy
        expect(subject.recurrence_period).to eq("monthly")
        expect(subject.number_of_parcels).to be_nil
        expect(subject.current_parcel).to be_nil
        expect(subject.competency_month).to eq("2015-10")
        expect(subject.financial_account_taxes_attributes).to be_empty
        expect(subject.links).to eq([
         {
           "rel" => "self",
           "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298917",
           "method" => "get"
         },
         {
           "rel" => "destroy",
           "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298917",
           "method" => "delete"
         },
         {
           "rel" => "receive",
           "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298917/receive",
           "method" => "put"
         },
         {
           "rel" => "next",
           "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298918",
           "method" => "get"
         },
         {
           "rel" => "destroy_recurrence",
           "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298917/recurrence",
           "method" => "delete"
         }
        ])
      end
    end

    context "when any data is invalid" do
      let(:params) { { due_date: "2015-10-20", amount: 150.99, create_as_recurrent: "october" } }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 422, message: "Unprocessable Entity", body: { "create_as_recurrent"=>["não está incluso na lista"] }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when entity does not exist" do
      subject { client.receivable_accounts.create_as_recurrent(555, {}) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 403, message: "Forbidden", body: {"error" => "Você não tem permissão para acessar este recurso." }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create_as_parcelled", vcr: true do
    let(:params) { { due_date: "2015-10-20", amount: 150.99, create_as_recurrent: "monthly", number_of_parcels: 7 } }
    subject { client.receivable_accounts.create_as_parcelled(entity_id, params) }

    context "with success" do
      it "creates a new object" do
        expect(subject.id).to eq(1298985)
        expect(subject.due_date).to eq(Date.new(2015, 10, 20))
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.status).to eq(1)
        expect(subject.status_name).to eq("unreceived")
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
        expect(subject.recurrence_id).to eq(8833)
        expect(subject.person_id).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-10-20T16:27:15-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-10-20T16:27:15-02:00"))
        expect(subject.recurrent).to be_falsy
        expect(subject.parcelled).to be_truthy
        expect(subject.recurrence_period).to eq("monthly")
        expect(subject.number_of_parcels).to eq(7)
        expect(subject.current_parcel).to eq(1)
        expect(subject.competency_month).to eq("2015-10")
        expect(subject.financial_account_taxes_attributes).to be_empty
        expect(subject.links).to eq(
          [
            {
              "rel" => "self",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298985",
              "method" => "get"
            },
            {
              "rel" => "destroy",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298985",
              "method" => "delete"
            },
            {
              "rel" => "receive",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298985/receive",
              "method" => "put"
            },
            {
              "rel" => "next",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298986",
              "method" => "get"
            },
            {
              "rel" => "destroy_recurrence",
              "href" => "https://sandbox.myfinance.com.br/entities/3798/receivable_accounts/1298985/recurrence",
              "method" => "delete"
            }
          ]
        )
      end
    end

    context "when any data is invalid" do
      let(:params) { { due_date: "2015-10-20", amount: 150.99, create_as_recurrent: "october", number_of_parcels: 7 } }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 422, message: "Unprocessable Entity", body: { "create_as_recurrent" => ["não está incluso na lista"] }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when entity does not exist" do
      subject { client.receivable_accounts.create_as_parcelled(555, {}) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 403, message: "Forbidden", body: { "error" => "Você não tem permissão para acessar este recurso." }).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy_as_recurrent", vcr: true do
    subject { client.receivable_accounts.destroy_as_recurrent(1298918, entity_id) }

    context "when receivable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when receivable account does not exist" do
      subject { client.receivable_accounts.destroy_as_recurrent(1215631099, entity_id) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy_many", vcr: true do
    let(:params) { { selected_ids: [1235047, 1235048, 1235049] } }
    subject { client.receivable_accounts.destroy_many(entity_id, params) }

    context "when receivable account exists" do
      it "returns true" do
        expect(subject).to be_truthy
      end
    end

    context "when receivable account does not exist" do
      subject { client.receivable_accounts.destroy_many(1215631099, params) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end

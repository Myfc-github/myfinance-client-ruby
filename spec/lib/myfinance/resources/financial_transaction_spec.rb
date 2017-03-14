require "spec_helper"

describe Myfinance::Resources::FinancialTransaction, vcr: true do
  let(:da_id) { 14268 }
  let(:ent_id) { 3798 }
  let(:ft_id) { 1663920 }
  let(:financial_transactions) { client.financial_transactions }
  let(:params) { { amount: 68.5, occurred_at: "2011-07-15", type: "Debit" } }
  let(:request_error) { Myfinance::RequestError }

  describe "#find_all" do
    context "when successful" do
      subject { client.financial_transactions.find_all(ent_id, da_id) }
      before :each do
        subject.build
      end

      it "returns a 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "return collection of FinancialTransactions" do
        expect(subject).to be_a(Myfinance::Entities::FinancialTransactionCollection)
      end
    end

    context "when supplying invalid IDs" do
      it "raises not found error with error 404" do
        expect { financial_transactions.find_all(nil, nil) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

  describe "#find" do
    context "when successful" do
      subject { client.financial_transactions.find(ent_id, da_id, ft_id) }

      it "returns a FinancialTransactions" do
        expect(subject).to be_a(Myfinance::Entities::FinancialTransaction)
      end
    end

    context "when supplying invalid IDs" do
      it "raises not found error with error 404" do
        expect { financial_transactions.find(nil, nil, nil) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

  describe "#create" do
    context "when successful" do
      let(:ft) { client.financial_transactions.create(ent_id, da_id, params) }

      it "returns created FT" do
        expect(ft.type).to eq("Debit")
        expect(ft.amount).to eq(-68.5)
        expect(ft.occurred_at).to eq(Date.new(2011, 07, 15))
      end
    end

    context "when supplying invalid params" do
      it "raises error" do
        params[:type] = "QUALQUER"
        expect { financial_transactions.create(ent_id, da_id, params) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(500)
        end
      end
    end
  end

  describe "#update" do
    context "when successful" do
      let(:params) { { id: ft_id, absolute_amount: BigDecimal.new(500), amount: BigDecimal.new(500) } }
      let(:ft) { client.financial_transactions.update(ent_id, da_id, ft_id, params) }

      it "returns updated FT" do
        expect(ft).to be_a(Myfinance::Entities::FinancialTransaction)
      end
    end

    context "when supplying invalid params" do
      let(:params) {{ absolute_amount: BigDecimal.new(500), occurred_at: "2011-07-15", type: "QUALQUER"}}

      it "raises error" do
        expect { financial_transactions.update(ent_id, da_id, ft_id, params) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(500)
        end
      end
    end
  end

  describe "#destroy" do
    context "when successful" do
      let(:ft) { client.financial_transactions.create(ent_id, da_id, params) }
      subject { client.financial_transactions.destroy(ent_id, da_id, ft.id) }

      it "returns 200 OK" do
        expect(subject.code).to eq(200)
      end

      context "when supplying unknown ID" do
        it "returns 404 not found" do
          expect { financial_transactions.destroy(ent_id, da_id, 99999) }.to raise_error(request_error) do |e|
            expect(e.code).to eq(404)
            expect(e.message).to eq("Not Found")
          end
        end
      end
    end
  end

  describe "#destroy_many" do
    context "when successful" do
      let(:params) { { amount: 42.42, occurred_at: "2011-07-15", type: "Debit" } }
      let(:ft) { client.financial_transactions.create(ent_id, da_id, params) }
      let(:ft2) { client.financial_transactions.create(ent_id, da_id, params) }
      subject { client.financial_transactions.destroy_many(ent_id, da_id, [ft.id, ft2.id]) }

      it "returns 200 OK" do
        expect(subject.code).to eq(200)
      end
    end
  end
end

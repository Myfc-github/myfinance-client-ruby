require "spec_helper"

describe Myfinance::Client do
  subject { client }

  describe "#initialize" do
    it "instantiates a new Myfinance::Http object" do
      expect(Myfinance::Http).to receive(:new).with("abc", nil)
      Myfinance::Client.new("abc")
    end

    context "when account_id is present" do
      it "instantiates a new Myfinance::Http object" do
        expect(Myfinance::Http).to receive(:new).with("abc", 123)
        Myfinance::Client.new("abc", 123)
      end
    end
  end

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") { expect(subject.authenticated?).to be_truthy }
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") { expect(subject.authenticated?).to be_falsey }
      end
    end
  end

  describe "#entities" do
    it "instantiates a new Myfinance::Resources::Entity" do
      expect(Myfinance::Resources::Entity).to receive(:new).with(subject.http)
      subject.entities
    end
  end

  describe "#payable_accounts" do
    it "instantiates a new Myfinance::Resources::PayableAccount" do
      expect(Myfinance::Resources::PayableAccount).to receive(:new).with(subject.http)
      subject.payable_accounts
    end
  end

  describe "#receivable_accounts" do
    it "instantiates a new Myfinance::Resources::ReceivableAccount" do
      expect(Myfinance::Resources::ReceivableAccount).to receive(:new).with(subject.http)
      subject.receivable_accounts
    end
  end

  describe "#attachments" do
    it "instantiates a new Myfinance::Resources::Attachment" do
      expect(Myfinance::Resources::Attachment).to receive(:new).with(subject.http)
      subject.attachments
    end
  end

  describe "#classification_centers" do
    it "instantiates a new Myfinance::Resources::ClassificationCenter" do
      expect(
        Myfinance::Resources::ClassificationCenter
      ).to receive(:new).with(subject.http)
      subject.classification_centers
    end
  end

  describe "#categories" do
    it "instantiates a new Myfinance::Resources::Category" do
      expect(Myfinance::Resources::Category).to receive(:new).with(subject.http)
      subject.categories
    end
  end

  describe "#accounts" do
    it "instantiates a new Myfinance::Resources::Account" do
      expect(Myfinance::Resources::Account).to receive(:new).with(subject.http)
      subject.accounts
    end
  end

  describe "#financial_transactions" do
    it "instantiates a new Myfinance::Resources::FinancialTransaction" do
      expect(
        Myfinance::Resources::FinancialTransaction
      ).to receive(:new).with(subject.http)

      subject.financial_transactions
    end
  end

  describe "#deposit_accounts" do
    it "instantiates a new Myfinance::Resources::DepositAccount" do
      expect(
        Myfinance::Resources::DepositAccount
      ).to receive(:new).with(subject.http)

      subject.deposit_accounts
    end
  end

  describe "#people" do
    it "instantiates a new Myfinance::Resources::Person" do
      expect(Myfinance::Resources::Person).to receive(:new).with(subject.http)
      subject.people
    end
  end

  describe "#webhooks" do
    it "instantiates a new Myfinance::Resources::Webhook" do
      expect(Myfinance::Resources::Webhook).to receive(:new).with(subject.http)
      subject.webhooks
    end
  end
end

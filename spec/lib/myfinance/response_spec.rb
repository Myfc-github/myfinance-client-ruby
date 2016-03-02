require "spec_helper"

describe Myfinance::Response do
  subject { described_class.new(response) }

  describe "#resolve!" do
    context 'when success' do
      let(:response) { double(success?: true) }

      it 'returns self' do
        expect(subject.resolve!).to eq(response)
      end

      context 'when block given' do
        let(:response) { double(success?: true) }

        it 'returns block' do
          expect(subject.resolve!{ response }).to eq(response)
        end
      end
    end

    context 'when timeout' do
      let(:response) { double(success?: false, timed_out?: true, code: 301) }

      it 'raises RequestTimeout' do
        expect { subject.resolve! }.to raise_error(Myfinance::RequestTimeout)
      end
    end

    context 'when not success neither timeout' do
      let(:response) { double(success?: false, timed_out?: false, code: 301, status_message: 'Moved Permanently', body: '') }

      it 'raises RequestError' do
        expect { subject.resolve! }.to raise_error do |error|
          expect(error).to be_a(Myfinance::RequestError)
          expect(error.code).to eq(301)
          expect(error.message).to eq("Moved Permanently")
          expect(error.body).to eq({})
        end
      end

      context "when status_message is empty" do
        context "when body has an 'error' key" do
          let(:response) { double(success?: false, timed_out?: false, code: 301, status_message: '', body: '{"error": "My custom error message"}') }

          it "raises RequestError with custom message" do
            expect { subject.resolve! }.to raise_error do |error|
              expect(error).to be_a(Myfinance::RequestError)
              expect(error.code).to eq(301)
              expect(error.message).to eq("My custom error message")
              expect(error.body).to eq({ "error" => "My custom error message" })
            end
          end
        end

        context "when body has an 'error' key" do
          let(:response) { double(success?: false, timed_out?: false, code: 301, status_message: '', body: '') }

          it "raises RequestError with empty message" do
            expect { subject.resolve! }.to raise_error do |error|
              expect(error).to be_a(Myfinance::RequestError)
              expect(error.code).to eq(301)
              expect(error.message).to eq("")
              expect(error.body).to eq({})
            end
          end
        end
      end
    end
  end

  describe "#body" do
    let(:response) { double(success?: true) }

    context "when JSON is invalid" do
      it "returns empty hash" do
        allow(subject).to receive(:body).and_return("{\"key\": ")
        expect(subject.parsed_body).to eq({})
      end
    end

    context "when JSON is valid" do
      it "returns empty hash" do
        allow(subject).to receive(:body).and_return("{\"key\": \"value\"}")
        expect(MultiJson).to receive(:load).with("{\"key\": \"value\"}").and_call_original
        expect(subject.parsed_body).to eq({ "key" => "value" })
      end
    end
  end
end

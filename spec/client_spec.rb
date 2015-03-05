require 'isms'

describe ISMS::Client do
  let(:request_stubs) { Faraday::Adapter::Test::Stubs.new }
  let (:test_connection) do
    Faraday.new do |builder|
      builder.adapter :test, request_stubs
    end
  end
  let(:client) { ISMS::Client.new }

  describe ".initialize" do
    it "complains when API key is not configured" do
      expect { ISMS::Client.new }.to raise_error(RuntimeError)
    end

    context "with API key" do
      before do
        allow(ISMS).to receive(:password).and_return("1234567890")
        allow(ISMS).to receive(:username).and_return("username")
      end

      it "should not complain if API key is given" do
        expect { ISMS::Client.new }.not_to raise_error
      end
    end
  end
end


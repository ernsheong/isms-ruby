require 'isms'

describe ISMS::Client do
  let(:request_stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:test_connection) do
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

  describe ".send_sms" do
    let(:send_sms_url) { '/isms_send.php' }
    before do
      allow(ISMS).to receive(:password).and_return("1234567890")
      allow(ISMS).to receive(:username).and_return("username")
    end

    context 'successful send' do
      let(:success_response) { "200 = SUCCESS" }

      before do
        allow(client).to receive(:connection).and_return(test_connection)
        request_stubs.post(send_sms_url) { |env| [ 200, {}, success_response ] }
      end

      it 'sends successfully' do
        result = client.send_sms('Hi there!', '60121231234')
        expect(result[:code]).to eq(200)
        expect(result[:description]).to eq('SUCCESS')
      end
    end
  end
end


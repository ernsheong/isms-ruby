require 'isms/configuration'
require 'faraday'

module ISMS
  class Client
    SEND_SMS_URL = '/isms_send.php'

    def initialize
      # Check for username and password
      raise RuntimeError, "Username and password not provided!" unless ISMS.username && ISMS.password
    end

    #
    # Returns Hash of :code and :description
    # code has the error code number
    # description is the error description
    #
    def send_sms(message_body, phone_no, type = 1)
      request_body = {}
      request_body[:un] = ISMS.username
      request_body[:pwd] = ISMS.password
      request_body[:dstno] = phone_no
      request_body[:msg] = message_body
      request_body[:type] = type

      faraday_response = connection.post do |request|
        request.url SEND_SMS_URL
        request.body = request_body
      end

      parse_response(faraday_response.body)
    end

    private

    def connection
      @connection ||= Faraday.new(url: ISMS.endpoint_url_with_protocol)
    end

    def parse_response(body)
      result_array = body.split('=')
      {
          code: result_array.first.strip.to_i,
          description: result_array.last.strip
      }
    end
  end
end
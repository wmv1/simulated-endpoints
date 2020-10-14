require "net/https"
require "uri"
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module Clients
  class GenericClient

    def get(path = '')
      Faraday.get(url+path, {ticket: service_ticket},
        "Service-Ticket" => service_ticket)
    end

    def post(path = '', params = {})
      Faraday.put(url+path, params.as_json.to_json,
        "Content-Type" => "application/json",
        "Service-Ticket" => service_ticket)
    end

    def put(path = '', params = {})
      Faraday.put(url+path, params.as_json.to_json,
        "Content-Type" => "application/json",
        "Service-Ticket" => service_ticket)
    end

    private

    def url
      ApiStub.config.origin_host
    end

   def service_ticket
      Cassette::Client.st_for(ApiStub.config.origin_service_name)
    end
  end
end
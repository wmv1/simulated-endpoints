require "net/https"
require "uri"

VERIFY_SSL = ApiStub.config.ssl_valitade

class GenericClient
  def get(path = '')
    http_connection.get(url+path, {ticket: service_ticket},
      "Service-Ticket" => service_ticket)
  end

  def post(path = '', params = {})
    http_connection.post(url+path, filtered_params(params),
      "Content-Type" => "application/json",
      "Service-Ticket" => service_ticket)
  end

  def put(path = '', params = {})
    http_connection.put(url+path, filtered_params(params),
      "Content-Type" => "application/json",
      "Service-Ticket" => service_ticket)
  end

  private

  def filtered_params(params)
    params.as_json["home"].to_json
  end

  def http_connection
    Faraday.new(ssl: {verify: VERIFY_SSL})
  end

  def url
    ApiStub.config.origin_host
  end

  def service_ticket
    return '' unless system_cas_configured?

    Cassette::Client.st_for(ApiStub.config.origin_service_name)
  end

  def system_cas_configured?
    ApiStub.config.systems_cas.base.present? && ApiStub.config.systems_cas.base != 'https://$cas-base/'
  end
end
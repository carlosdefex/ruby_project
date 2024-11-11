require 'rest-client'
require 'json'

class ApiClient
  def self.get(url)
    response = RestClient.get(url)
    parse_response(response)
  end

  def self.post(url, payload)
    response = RestClient.post(url, payload.to_json, { content_type: :json, accept: :json })
    parse_response(response)
  end

  private

  def self.parse_response(response)
    {
      code: response.code,
      body: JSON.parse(response.body)
    }
  end
end
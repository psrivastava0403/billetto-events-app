# app/services/billetto_api_service.rb
class BillettoApiService
  include HTTParty
  base_uri 'https://billetto.dk/api/v3/public'

  def fetch_events
    response = self.class.get('/events?limit=100', headers: headers)

    unless response.success?
      raise "API Error: #{response.code}"
    end

    response.parsed_response
    
  end

  private

  def headers
    {
      "Api-Keypair" => "#{ENV['BILLETTO_API_KEY']}:#{ENV['BILLETTO_API_SECRET']}"
    }
  end
end
class Translation < ActiveRecord::Base
  belongs_to :line

  def self.generate(string, language_code)
    # Public testing API key, replace with your own if needed
    # TODO refactor MS translation API calls into separate gem
    r = RestClient.post('https://datamarket.accesscontrol.windows.net/v2/OAuth2-13', :grant_type => 'client_credentials', :client_id => '0000000000', :client_secret => 'pEGjuuUB2y3OUhkcG2CHTNr4MoWw9hX+nDCu75HbMc8=', :scope => 'http://api.microsofttranslator.com')
    token = JSON.parse(r)
    uri = URI('http://api.microsofttranslator.com/V2/Http.svc/Translate')
    params = {'from' => 'en', 'to' => 'de', 'text' => string}
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri.request_uri)
    req['Authorization'] = 'Bearer ' + token['access_token']
    res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
    res
  end

end

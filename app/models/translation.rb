class Translation < ActiveRecord::Base
  belongs_to :line

  SERVICE_URL = "https://www.googleapis.com/language/translate/v2"

  def self.create_from_line(line, target_language)
    remote_translation = RestClient.get(SERVICE_URL, :params => { 
      :key => API_KEYS['google'], 
      :q => line.text, 
      :source => line.language, 
      :target => target_language
    })
    text = JSON::parse(remote_translation)['data']['translations'][0]['translatedText']
    self.create!(:text => text, :language => target_language)
  end

end

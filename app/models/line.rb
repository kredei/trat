class Line < ActiveRecord::Base
  belongs_to :chat

  scope :recent, lambda { |chat_id| 
    where(:chat_id => chat_id).order("created_at desc").limit(10)
  }

  def audio_address
    service_url = "http://api.ispeech.org/api/rest"
    api_key = "?apikey=" + API_KEYS['ispeech']

    service_url + api_key + "&action=convert&format=ogg&text=" + text
  end

end

class Line < ActiveRecord::Base
  belongs_to :chat

  scope :recent, lambda { |chat_guid| 
    joins(:chat).where(:chats => {:guid => chat_guid}).order("created_at desc").limit(10)
  }

  def audio_address
    service_url = "http://api.ispeech.org/api/rest"
    api_key = "?apikey=" + API_KEYS['ispeech']

    service_url + api_key + "&action=convert&format=ogg&text=" + text
  end

end

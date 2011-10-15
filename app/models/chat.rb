class Chat < ActiveRecord::Base
  has_many :lines
  before_create :generate_guid

  protected
  
  def generate_guid
    self.guid = UUIDTools::UUID.timestamp_create(Time.now).to_s
  end

end

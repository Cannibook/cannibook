class Dispensary < ActiveRecord::Base
  before_validation :geocode
  
  has_many :strains
  
  validates_presence_of :name, :street, :city, :state, :zip
  validates_uniqueness_of :name

  # output a records full address
  def address
    "#{self.street}, #{self.city}, #{self.state}, #{self.zip}"
  end
  
  private
  
    # grab the latatitude and longitude of the address
    def geocode
      loc = MultiGeocoder.geocode(self.address)
      self.lat = loc.lat
      self.lng = loc.lng
    end
end

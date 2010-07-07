class Dispensary < ActiveRecord::Base
  has_many :strains
  
  validates_presence_of :name, :street, :city, :state, :zip
  validates_uniqueness_of :name

  # output a records full address
  def address
    "#{self.street}, #{self.city}, #{self.state} #{self.zip}"
  end
end

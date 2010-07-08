class Strain < ActiveRecord::Base
  belongs_to :dispensary
  
  validates_presence_of :name
end

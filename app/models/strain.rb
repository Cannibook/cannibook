class Strain < ActiveRecord::Base
  belongs_to :dispensary
  
  validates_presence_of :name
  
  acts_as_taggable_on :smells, :tastes
end

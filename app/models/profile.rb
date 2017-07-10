class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :country 
  has_and_belongs_to_many :interests 
  #MARIAH
  accepts_nested_attributes_for :interests 
  
  #MARIAH: serach  
   def self.search(search)
      where("title LIKE ?", "%#{search}%")
   end
end

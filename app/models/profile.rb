class Profile < ApplicationRecord
  belongs_to :user
  has_one :country 
  has_and_belongs_to_many :interests 
end

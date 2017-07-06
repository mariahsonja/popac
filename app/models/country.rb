class Country < ApplicationRecord
  has_many :profiles
  
  validates :name, uniqueness: true
end

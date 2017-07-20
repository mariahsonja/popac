class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :country 
  has_and_belongs_to_many :conversations
  has_and_belongs_to_many :interests 
  
  # MARIAH
  accepts_nested_attributes_for :interests
  
  validates :name, presence: true
  validates :bio, presence: true
  validates :interests, presence: true
  
  # MARIAH: search  
  def self.search(params)
    results = unscoped.distinct
    results = results.where(country_id: params[:country_ids]) if params[:country_ids].present?
    results = results.joins(:interests).where(interests: { id: params[:interest_ids] } ) if params[:interest_ids].present?
    results
  end
end

class Conversation < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :profiles

  def header
    profiles.pluck(:name).to_sentence
  end
  
  def last_message
    messages.last&.content
  end
end
class Message < ApplicationRecord
  belongs_to :sender, class_name: Profile.name
  belongs_to :conversation
  
  validates :content, presence: true
  
  default_scope { order('updated_at DESC') }
  
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
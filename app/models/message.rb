class Message < ApplicationRecord
  belongs_to :sender, class_name: Profile
  belongs_to :conversation
  
  default_scope { order('updated_at DESC') }
end
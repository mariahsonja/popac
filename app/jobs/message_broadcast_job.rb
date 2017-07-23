class MessageBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(message)
    ActionCable.server.broadcast "conversations_#{message.conversation_id}_channel",
                                 message: render_message(message)
  end
  
  private
  
  def render_message(message)
    ConversationsController.render partial: 'conversations/message', locals: { message: message }
  end
end
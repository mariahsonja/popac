class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_#{params['conversation_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    @conversation = Conversation.find(data["conversation_id"])
    @conversation.messages.create!(content: data["content"], sender: current_user.profile)
  end
end
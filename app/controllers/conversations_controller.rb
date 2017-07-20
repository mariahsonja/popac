class ConversationsController < ApplicationController
  before_action :load_profile
  before_action :load_conversations
  
  def index
  end

  def show
    @conversation = @conversations.find(params[:id])
  end
  
  def create
    @conversation = @conversations.create
    @conversation.profiles << Profile.find(params[:profile_id])
    redirect_to profile_conversation_path(current_user.profile, @conversation)
  end
  
  def send_message
    @conversation = @conversations.find(params[:id])
    @conversation.messages.create!(send_message_params)
  end
  
  private
  
  def load_profile
    @profile = current_user.profile
  end
  
  def load_conversations
    @conversations = @profile.conversations
  end
  
  def send_message_params
    params.require(:message).permit(:content).merge(sender: @profile)
  end
end
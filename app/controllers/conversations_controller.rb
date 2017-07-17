class ConversationsController < ApplicationController
  before_action :load_profile
  before_action :load_conversations
  
  def index
  end

  def show
    @conversation = @conversations.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  private
  
  def load_profile
    @profile = current_user.profile
  end
  
  def load_conversations
    @conversations = @profile.conversations
  end
end
class ConversationsController < ApplicationController
  before_action :load_conversations
  
  def index
  end

  def show
  end
  
  def new
  end
  
  def create
  end
  
  def destroy
  end
  
  private
  
  def load_conversations
    @conversations = current_user.profile.conversations
  end
end
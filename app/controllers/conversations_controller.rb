class ConversationsController < ApplicationController
  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])

    add_to_conversation unless conversated?

    respond to do |format|
      format.js
    end
  end

  private

  def add_to_conversation
    session[:conversations] ||= []
    session[:conversations] << @conversations.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end

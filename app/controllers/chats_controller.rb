class ChatsController < ApplicationController
  
  def create
    @chat = Chat.create!
    redirect_to :action => 'show', :id => @chat.guid
  end

  def show
    @chat = Chat.where(:guid => params[:id]).first
    @line = Line.new
  end

end

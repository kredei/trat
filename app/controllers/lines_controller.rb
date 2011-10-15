class LinesController < ApplicationController

  def create
    @line = Line.create!(params[:line].merge({:chat_id => Chat.where(:guid => params[:chat_id]).first.id}))

    respond_to do |format|
      format.js
    end
  end

  def index
    head :not_found unless params[:chat_id]
    @lines = Line.recent(params[:chat_id])

    respond_to do |format|
      format.js
    end
  end

end

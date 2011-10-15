class LinesController < ApplicationController

  def create
    @line = Line.create!(params[:line])

    respond_to do |format|
      format.js
    end
  end
end

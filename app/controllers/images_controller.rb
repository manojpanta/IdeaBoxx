class ImagesController < ApplicationController
  def index
    if params[:idea_id]
      @idea = Idea.find(params[:idea_id])
    end
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end
end

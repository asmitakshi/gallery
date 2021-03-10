class HomeController < ApplicationController
  def index
   @q = Album.ransack(params[:q])
  @albums= @q.result.includes(:taggings , :tags)
  end
  def show
    @album=Album.find(params[:id])
  end
  
  
end

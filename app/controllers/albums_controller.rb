class AlbumsController < ApplicationController
   before_action :authenticate_user! , except: [:index , :show]
  def index
  @q = Album.ransack(params[:q])
  @albums = @q.result.includes(:taggings , :tags)
end

  def new
    @album=Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  

  def edit
    @album = Album.find(params[:id])
  end
  

  def show
    @album=Album.find(params[:id])
  end

  def delete_upload
  attachment = ActiveStorage::Attachment.find_by(id:params[:upload_id])
  attachment.purge
  redirect_back(fallback_location: albums_path)
end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end
  end
def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
end

  

  private
    def album_params
      params.require(:album).permit(:title, :description, :user_id, :all_tags , :published ,images: []  )
    end
end

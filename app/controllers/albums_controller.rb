class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @band = flash[:band]
    @album = Album.new
    render :new
  end

  def create
    if params[:album][:live]=="1"
      params[:album][:live] = true
    else
      params[:album][:live] = false
    end
    band = Band.find_by(id: params[:album][:band_id])
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :year, :title, :live)
  end
end

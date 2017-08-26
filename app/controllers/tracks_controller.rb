class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @tracks = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :bonus, :album_id, :ord)
  end
end

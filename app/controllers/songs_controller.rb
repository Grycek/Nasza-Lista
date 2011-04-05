class SongsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :authenticate_admin, :only => [:edit, :update, :destroy]
  def index
    @songs = Song.find(:all, :order => 'LOWER(artist) ASC')
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.new(params[:song])
    if @song.save
      redirect_to @song, :notice => "Successfully created song."
    else
      render :action => 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to @song, :notice  => "Successfully updated song."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url, :notice => "Successfully destroyed song."
  end
end

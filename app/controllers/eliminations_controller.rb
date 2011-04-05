class EliminationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin, :only => [:index]
  
  def index
      @songs        = Song.find(:all, :order => 'LOWER(artist) ASC')
      @eliminations = Elimination.all
  end
  
  def new
     @elimination = current_user.build_elimination
     (1..11).each {|i| @elimination.elimination_votes.build }
     @songs = Song.where("user_id != ?", current_user.id).order('LOWER(artist) asc')
  end
  
  def create
    @songs       = Song.where("user_id != ?", current_user.id).order('LOWER(artist) asc')
    @elimination = current_user.build_elimination(params[:elimination])
    if @elimination.save
      flash[:notice] = "Głosy przyjęto"
      redirect_to profile_path
    else
      render :action => 'new'
    end

  end

end

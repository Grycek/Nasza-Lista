class EliminationsController < ApplicationController
  uses_tiny_mce :options => { :theme => 'advanced',
                              :mode => "textareas",
                              :convert_urls => false,
                              :theme_advanced_buttons1 => "bold,italic,underline,separator,strikethrough,bullist,numlist,link,separator,forecolor,backcolor",
                              :theme_advanced_buttons2 => "",
                              :theme_advanced_buttons3 => "", } , :only => [:new, :edit, :update, :create]
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

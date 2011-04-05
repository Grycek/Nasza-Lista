class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @songs = current_user.songs
    @votes = []
    if current_user.elimination != nil
      @votes = current_user.elimination.elimination_votes
    end
    @votes = @votes.sort_by {|t| -t.points}
  end
end

class EliminationVote < ActiveRecord::Base
    validates_uniqueness_of :song_id, :scope => [:elimination_id]
    validates_uniqueness_of :points, :scope => [:elimination_id]
    validates_presence_of :points
    validates_presence_of :song_id
    validates_inclusion_of :points, :in => 0..12, :message => "can only be between 0 and 12."
    
    belongs_to :song
    belongs_to :elimination
end

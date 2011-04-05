class EliminationResult < ActiveRecord::Base
    validates_uniqueness_of :song_id
    validates_uniqueness_of :position
    belongs_to :song
end

class Elimination < ActiveRecord::Base
    validates_uniqueness_of :user_id
    validates_presence_of :user_id
    belongs_to :user
    has_many :elimination_votes, :dependent => :destroy
    accepts_nested_attributes_for :elimination_votes
    validate :uniq_songs
    validate :uniq_positions
    
    def uniq_songs
        if elimination_votes != nil
          errors.add('Nie mozna glosowac', 'kilka razy na ten sam utwór.') if (elimination_votes.map(&:song_id).uniq.size != elimination_votes.size)
        end
    end
    
    def uniq_positions
        if elimination_votes != nil
          errors.add('Nie mozna glosowac', 'kilka razy na tę samą pozycję.') if (elimination_votes.map(&:points).uniq.size != elimination_votes.size)
        end
    end
end

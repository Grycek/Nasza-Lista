class Song < ActiveRecord::Base
  attr_accessible :title, :artist, :user_id, :description #:edycja_id, :czas,
  belongs_to :user
  has_many :elimination_votes
  has_many :elimination_results
  validates :title, :presence     => true
  validates :artist, :presence     => true
  validates :user_id, :presence     => true
  validate :song_limit

  def song_limit
    if user.songs.length > 1
      errors.add_to_base("Cannot add more than 2 songs")
    end
  end

end

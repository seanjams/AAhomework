class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :art_works,
  class_name: "ArtWork",
  foreign_key: :artist_id,
  primary_key: :id,
  dependent: :destroy

  has_many :art_work_shares,
  class_name: "ArtWorkShare",
  foreign_key: :viewer_id,
  primary_key: :id,
  dependent: :destroy

  has_many :shared_art_works, through: :art_work_shares, source: :art_work


end

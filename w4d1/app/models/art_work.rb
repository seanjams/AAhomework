class ArtWork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: {scope: :artist_id, message: "One title per artist"}

  belongs_to :artist,
  class_name: "User",
  foreign_key: :artist_id,
  primary_key: :id

  has_many :art_work_shares,
  class_name: "ArtWorkShare",
  foreign_key: :art_work_id,
  primary_key: :id

  has_many :shared_viewers, through: :art_work_shares, source: :viewer

end

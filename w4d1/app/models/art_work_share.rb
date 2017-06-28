class ArtWorkShare < ApplicationRecord
  validates :viewer_id, :art_work_id, presence: true
  validates :viewer_id, uniqueness: {scope: :art_work_id, message: "artwork is already shared before"}

  belongs_to :art_work,
  class_name: "ArtWork",
  foreign_key: :art_work_id,
  primary_key: :id

  belongs_to :viewer,
  class_name: "User",
  foreign_key: :viewer_id,
  primary_key: :id

end

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validate :valid_sex

  has_many :cat_rental_requests,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest


  private

  def valid_sex
    errors[:sex] << "Not a valid sex (lol)" unless sex == "M" || sex == "F"
  end
end

class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED']}#.join(' ')
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :dates_are_fine, :does_not_overlap_approved_request

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat,
  dependent: :destroy

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where.not(id: id)
      .where.not('start_date > ? OR end_date < ?', end_date, start_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    overlapping_approved_requests.exists?
  end

  def dates_are_fine
    unless start_date < end_date
      errors[:start_date] << "Start date must be before end date"
    end
  end
end

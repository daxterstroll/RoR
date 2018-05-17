class Review < ActiveRecord::Base

  belongs_to :reviewable, :polymorphic => true
  belongs_to :booking
  belongs_to :user
  belongs_to :item

  validates :reviewable_id, presence: true
  validates :reviewable_type, presence: true

  validate :must_be_booking

  def must_be_booking
    errors.add(:reviewable_id, 'Must be booking to leave a review') unless
        reviewable_id == Booking.find_by(item_id: reviewable_id).item_id &&
            user_id == Booking.find_by(item_id: reviewable_id).user_id
    end
end

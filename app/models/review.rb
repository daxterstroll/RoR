class Review < ActiveRecord::Base

  belongs_to :reviewable, :polymorphic => true
  belongs_to :booking
  belongs_to :user
  belongs_to :item

  validate :must_be_booking_item
  def must_be_booking_item
    test = Booking.find_by user_id: reviewable_id
    unless reviewable_id == test.user_id
      errors[:base] << 'Must be booking to leave a review'
    end
  end

end

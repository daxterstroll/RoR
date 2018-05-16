class Review < ActiveRecord::Base

  belongs_to :reviewable, :polymorphic => true
  belongs_to :booking
  belongs_to :user
  belongs_to :item

  validate :must_be_booking_item
  def must_be_booking_item
    test1 = Booking.find_by item_id: reviewable_id
    test2 = Booking.find_by user_id: user_id

    unless (reviewable_id == test1.item_id) && (user_id == test2.user_id)
      errors[:base] << 'Must be booking to leave a review'
    end
  end

end

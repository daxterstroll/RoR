class Review < ActiveRecord::Base
  # connect choice users
  belongs_to :user
  # connect polymorphic
  belongs_to :reviewable, polymorphic: true, required: true
  # checking on booking
  validate :must_be_booking
  def must_be_booking
    if reviewable_type == 'Item'
      errors.add(:reviewable, 'You have not booked') unless
          Booking.exists?(user_id: user_id, item_id: reviewable_id)
    elsif reviewable_type == 'User'
      errors.add(:reviewable, 'You are not trading') unless
          User.joins(bookings: :item)
              .exists?(users: { id: user_id },
                       items: { user_id: reviewable_id })
    end
  end
end
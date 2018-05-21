class Review < ActiveRecord::Base
  # connect choice users
  belongs_to :user
  # connect polymorphic
  belongs_to :reviewable, polymorphic: true, required: true
  # checking on booking
  validate :must_be_booking
  def must_be_booking
    bool = User.joins(bookings: :item)
               .exists?(users: { id: user_id },
                        bookings: { item_id: reviewable_id })
    bool == true ? return : errors.add(:reviewable, 'You have not booked')
  end
end
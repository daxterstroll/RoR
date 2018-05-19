class Review < ActiveRecord::Base
#Подключает выбор пользователя
  belongs_to :user

#Подключает полиморфизм
  belongs_to :reviewable, :polymorphic => true

  validates :reviewable_id, presence: true
  validates :reviewable_type, presence: true
  validate :must_be_booking

  def must_be_booking
    errors.add(:reviewable, 'You must rent a item to leave a review') unless
        Booking.exists?(user_id: user_id, item_id: reviewable_id) == true
  end

end

class Review < ActiveRecord::Base
  # connect choice users
  belongs_to :user
  # connect polymorphic
  belongs_to :reviewable, polymorphic: true, required: true
  # checking on booking
  validate :must_be_booking
  def must_be_booking
    errors.add(:reviewable, 'You must rent a item to leave a review') unless User.joins(bookings: :item).exists?( :users => { :id => user_id }, :bookings => {:item_id => reviewable_id}) == true
  end
end
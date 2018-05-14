class Review < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true
  belongs_to :booking
  belongs_to :user
  belongs_to :item

  validates_presence_of :booking, :user, :item
end
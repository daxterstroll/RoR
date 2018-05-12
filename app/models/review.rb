class Review < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true

  has_one :item
  has_one :user, :through => :item
end

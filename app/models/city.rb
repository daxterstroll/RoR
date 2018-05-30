class City < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :items, through: :users, dependent: :destroy

  validates :name, presence: true
end
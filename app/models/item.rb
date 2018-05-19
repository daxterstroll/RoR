class Item < ActiveRecord::Base
  has_one :user

#Подключает полиморфизм
  has_many :reviews, :as => :reviewable, through: :user

#подключает таблицу пользователей
  belongs_to :user
end
class Item < ActiveRecord::Base
  #Подключает полиморфизм
  has_many :reviews, :as => :reviewable

  #подключает таблицу пользователей
  belongs_to :user
end
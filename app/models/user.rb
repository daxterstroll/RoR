class User < ActiveRecord::Base
#Подключает полиморфизм
  has_many :reviews, :as => :reviewable

#Поделючает предметы
  has_many :items

#Подключает выбор города
  belongs_to :city
end

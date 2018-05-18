class Booking < ActiveRecord::Base
#Поделючает выбор пользователя
  belongs_to :user

#Подключает выбор предмета
  belongs_to :item
end

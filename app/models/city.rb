class City < ActiveRecord::Base
#поделючает пользователей
  has_many :users
#добавляет предметы через пользователя
  has_many :items, through: :users
end
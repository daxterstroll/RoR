class City < ActiveRecord::Base
#подключает пользователей
  has_many :users
#добавляет предметы через пользователя
  has_many :items, through: :users
end
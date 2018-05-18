class Review < ActiveRecord::Base
#Подключает полиморфизм
  belongs_to :reviewable, :polymorphic => true

#Подключает выбор пользователя
  belongs_to :user
end

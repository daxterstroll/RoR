class Review < ActiveRecord::Base
#Подключает выбор пользователя
  belongs_to :user

#Подключает полиморфизм
  belongs_to :reviewable, :polymorphic => true
end

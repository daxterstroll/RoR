# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


City.create([{ name: 'Odessa' },
             { name: 'Simferopol' }])

User.create([{ name: 'Oksana', city_id: City.find_by(name: 'Simferopol').id },
             { name: 'Diana', city_id: City.find_by(name: 'Odessa').id }])

Item.create([{ name: 'coca-cola', user_id: User.find_by(name: 'Oksana').id },
             { name: 'boots', user_id: User.find_by(name: 'Diana').id }])

Booking.create([{ started_at: '2018-05-21',
                  ended_on: '2018-05-25',
                  item_id: Item.find_by(name: 'coca-cola',
                                        user_id: User.find_by(name: 'Oksana')).id,
                  user_id: User.find_by(name: 'Diana').id }])

Booking.create([{ started_at: '2018-05-22',
                  ended_on: '2018-05-26',
                  item_id: Item.find_by(name: 'boots',
                                        user_id: User.find_by(name: 'Diana')).id,
                  user_id: User.find_by(name: 'Oksana').id }])

Review.create([{ reviewable_id: Item.find_by(name: 'coca-cola').id,
                 reviewable_type: 'Item',
                 user_id: User.find_by(name: 'Diana').id,
                 message: 'Good drink' }])

Review.create([{ reviewable_id: Item.find_by(name: 'boots').id,
                 reviewable_type: 'Item',
                 user_id: User.find_by(name: 'Oksana').id,
                 message: 'Nice boots!' }])
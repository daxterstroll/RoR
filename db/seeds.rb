City.create([{ name: 'Odessa' }, { name: 'Simferopol' }])

User.create([{ name: 'Oksana', city_id: City.find_by(name: 'Simferopol').id },
             { name: 'Diana', city_id: City.find_by(name: 'Odessa').id }])

Item.create([{ name: 'coca-cola', user_id: User.find_by(name: 'Oksana').id },
             { name: 'boots', user_id: User.find_by(name: 'Diana').id }])

Booking.create([{ started_at: '2018-05-31',
                  ended_on: '2018-07-01',
                  item_id: Item.find(1).id, user_id: User.find(2).id }])

Booking.create([{ started_at: '2018-05-31',
                  ended_on: '2018-07-01',
                  item_id: Item.find(2).id, user_id: User.find(1).id }])

Review.create([{ reviewable_id: Item.find_by(name: 'coca-cola').id,
                 reviewable_type: 'Item',
                 user_id: User.find_by(name: 'Diana').id,
                 message: 'Good drink' }])

Review.create([{ reviewable_id: Item.find_by(name: 'boots').id,
                 reviewable_type: 'Item',
                 user_id: User.find_by(name: 'Oksana').id,
                 message: 'Nice boots!' }])
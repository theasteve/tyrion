user = User.create(name: 'Sam Tali')

stock = user.stocks.create!(name: 'PLTR')

category1 = stock.categories.create(name: "News", user: user)
category2 = stock.categories.create(name: "Risks", user: user)

field_values = '[{"type": "link", "value": "url to article" }]'
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)
category1.items.create(name: 'Me', user: user, values: field_values)

field_values = '[{"type": "tweet", "value": "link to tweet" }]'
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)
category2.items.create(name: 'You', user: user, values: field_values)

puts "Seeded the database"
puts "Stock ID: #{stock.id}"

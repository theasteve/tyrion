# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create({full_name: 'Michael Jackson', email: 'a@example.com', password: 'abc', password_confirmation: 'abc'})
user2 = User.create({full_name: 'Jim Jones', email: 'b@example.com', password: 'abc', password_confirmation: 'abc'})
user3 = User.create({full_name: 'Alex Karp', email: 'c@example.com', password: 'abc', password_confirmation: 'abc'})
user4 = User.create({full_name: 'Peter Thiel', email: 'd@example.com', password: 'abc', password_confirmation: 'abc'})
user5 = User.create({full_name: 'Cookie', email: 'e@example.com', password: 'abc', password_confirmation: 'abc'})
user6 = User.create({full_name: 'Tom Brady', email: 'f@example.com', password: 'abc', password_confirmation: 'abc'})
user7 = User.create({full_name: 'Hilary CLinton', email: 'g@example.com', password: 'abc', password_confirmation: 'abc'})
user8 = User.create({full_name: 'Kimberly Wang', email: 'h@example.com', password: 'abc', password_confirmation: 'abc'})
user9 = User.create({full_name: 'Charlize Theron', email: 'i@example.com', password: 'abc', password_confirmation: 'abc'})

transaction1 = StockTransaction.create({user_id: 1, stock_id: 5, track: true, buying: true })

transaction2 = StockTransaction.create({user_id: 2, stock_id: 5, track: true, selling: true })

transaction3 = StockTransaction.create({user_id: 3, stock_id: 5, track: true, holding: true })

stock5 = Stock.find(5)
stock5.buying = 1
stock5.selling = 1
stock5.holding = 1


transaction4 = StockTransaction.create({user_id: 2, stock_id: 3, track: true, holding: true })

transaction5 = StockTransaction.create({user_id: 3, stock_id: 3, track: true, holding: true })

stock3 = Stock.find(3)
stock3.holding = 2



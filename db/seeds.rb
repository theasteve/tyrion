# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

topic = Topic.create({title: 'Linked List Java',
                      description: 'HOw to iterate',
                      questions: 'What is big O',
                      user_id: 1})
topic.save!

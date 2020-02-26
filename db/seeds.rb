# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "bdarab", email: "bdarab@example.com", password: "123456", password_confirmation: "123456", admin: true)
User.create(username: "john", email: "john@example.com", password: "123456", password_confirmation: "123456")
User.create(username: "jane", email: "jane@example.com", password: "123456", password_confirmation: "123456")
User.create(username: "samaa", email: "samaa@example.com", password: "123456", password_confirmation: "123456")
User.create(username: "snow", email: "snow@example.com", password: "123456", password_confirmation: "123456")
User.create(username: "ariya", email: "ariya@example.com", password: "123456", password_confirmation: "123456")

#Message.create(body: "My first testing message", user: User.last)
#Message.create(body: "My first testing message", user: User.find(2))
#Message.create(body: "My first testing message", user: User.find(3))
#Message.create(body: "My first testing message", user: User.find(4))
#Message.create(body: "My first testing message", user: User.find(5))
#Message.create(body: "My first testing message", user: User.find(6))
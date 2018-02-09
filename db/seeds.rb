# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
u = User.create! username: "cwy", email: "cwy@example.com", password: "password"

u.tasks.create! name: "Meet Mr. Miyagi", complete: true
u.tasks.create! name: "Paint the fence", complete: true
u.tasks.create! name: "Wax the car"
u.tasks.create! name: "Sand the deck"

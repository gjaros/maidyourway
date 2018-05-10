# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@gmail.com", role: "admin", username: "Admin", password: "password", password_confirmation: "password")
User.create(email: "manager@gmail.com", role: "manager", username: "Manager", password: "password", password_confirmation: "password")
User.create(email: "worker@gmail.com", role: "worker", username: "Worker", password: "password", password_confirmation: "password")
User.create(email: "client@gmail.com", username: "Client", password: "password", password_confirmation: "password")

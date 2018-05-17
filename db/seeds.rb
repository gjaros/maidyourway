# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin/manager
User.create(email: "admin@example.com", role: "admin", username: "Admin", password: "password", password_confirmation: "password")
User.create(email: "manager@example.com", role: "manager", username: "Manager", password: "password", password_confirmation: "password")
# workers
User.create(email: "jsmith@example.com", role: "worker", username: "jsmith", password: "password", password_confirmation: "password")
User.create(email: "tgreen@example.com", role: "worker", username: "tgreen", password: "password", password_confirmation: "password")
User.create(email: "sbell@example.com", role: "worker", username: "sbell", password: "password", password_confirmation: "password")
User.create(email: "amiller@example.com", role: "worker", username: "amiller", password: "password", password_confirmation: "password")
User.create(email: "cbrown@example.com", role: "worker", username: "cbrown", password: "password", password_confirmation: "password")
User.create(email: "dwalker@example.com", role: "worker", username: "dwalker", password: "password", password_confirmation: "password")
# clients
User.create(email: "jwood@example.com", username: "jwood", password: "password", password_confirmation: "password", name: "Josh Wood", street: "2531 Nash Street", city: "Detroit", state: "MI", zip: 48207)
User.create(email: "jrobinson@example.com", username: "jrobinson", password: "password", password_confirmation: "password", name: "Jake Robinson", street: "604 Saints Alley", city: "Plant City", state: "FL", zip: 33566)
User.create(email: "tlewis@example.com", username: "tlewis", password: "password", password_confirmation: "password", name: "Taylor Lewis", street: "3395 Raintree Boulevard", city: "Anderson", state: "IN", zip: 46011)

# blog_posts
post = BlogPost.create!(user_id: 1, title: "Best Practices for Hiring a Housekeeper", blog: "Between work, caring for your family, and other commitments, you already have precious little free time. It's understandable that you don't want to spend part of every weekend cleaning your home. A professional housecleaner can take over this task for you, but choosing the right one to hire isn't always easy.")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_1.jpg").open
post.save!
post = BlogPost.create!(user_id: 1, title: "Dinner Party for 8? No Problem!", blog: "Have you gazed longingly in a glossy magazine and wished that you too could pull off a dinner party for eight?")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_2.jpg").open
post.save!
post = BlogPost.create!(user_id: 1, title: "5 Healthy Habbits to Share With Your Family", blog: "Good health does not occur as a sudden understanding of what keeps people healthy. Rather, it is habits individuals engage in on a daily basis.")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_3.jpg").open
post.save!

# jobs
Job.create(name: "Sweep Floor", datetime: Time.strptime('05/16/2018 08:30', '%m/%d/%Y %H:%M'), created_by: 1, client_id: 9, workers: 3 , notes: "Get under couch")
Job.create(name: "Wash Windows", datetime: Time.strptime('05/22/2018 11:30', '%m/%d/%Y %H:%M'), created_by: 2, client_id: 10, workers: 4, notes: "Remove all spots")
Job.create(name: "Clean Kitchen", datetime: Time.strptime('05/16/2018 12:00', '%m/%d/%Y %H:%M'), created_by: 1, client_id: 11, workers: 7, notes: "Wipe down cabinets")

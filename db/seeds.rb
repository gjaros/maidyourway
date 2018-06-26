# rake db:drop:_unsafe
# rake db:create
# rake db:migrate
# rake db:seed

# admin/manager
User.create(email: "admin@maidyourway.com", role: "admin", username: "Admin", password: "password", password_confirmation: "password")
User.create(email: "manager@maidyourway.com", role: "manager", username: "Manager", password: "password", password_confirmation: "password")

# workers
20.times do
  name = Faker::Name.first_name + " " + Faker::Name.last_name
  username = Faker::Internet.user_name(name, %w(.))
  email = username + "@maidyourway.com"

  user = User.create!(role: 'worker', name: name, username: username, email: email, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, password: "password", password_confirmation: "password")
end

# clients
100.times do
  name = Faker::Name.first_name + " " + Faker::Name.last_name
  username = Faker::Internet.user_name(name, %w(.))
  email = username + ["@hotmail.com", "@gmail.com", "@yahoo.com"].sample

  user = User.create!(name: name, username: username, email: email, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, password: "password", password_confirmation: "password")

  rand(3..10).times do
    month = rand(1..12)
    days = rand(1..Time.days_in_month(month))
    job = Job.create!(name: Faker::Lorem.words(2).join(" "), datetime: Time.new(2018, month, days, rand(8..16), [00, 15, 30, 45].sample, 0), created_by: 1, client_id: user.id, notes: Faker::Lorem.sentence, workers: User.where(role: "worker").sample)
  end
end

# blog_posts
post = BlogPost.create(user_id: 1, title: "Best Practices for Hiring a Housekeeper", blog: "Between work, caring for your family, and other commitments, you already have precious little free time. It's understandable that you don't want to spend part of every weekend cleaning your home. A professional housecleaner can take over this task for you, but choosing the right one to hire isn't always easy.")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_1.jpg").open
post.save!
post = BlogPost.create(user_id: 1, title: "Dinner Party for 8? No Problem!", blog: "Have you gazed longingly in a glossy magazine and wished that you too could pull off a dinner party for eight?")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_2.jpg").open
post.save!
post = BlogPost.create(user_id: 1, title: "5 Healthy Habbits to Share With Your Family", blog: "Good health does not occur as a sudden understanding of what keeps people healthy. Rather, it is habits individuals engage in on a daily basis.")
post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_3.jpg").open
post.save!

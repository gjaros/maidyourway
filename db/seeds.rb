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

  # jobs
  rand(3..10).times do
    month = rand(1..12)
    days = rand(1..Time.days_in_month(month))
    workers = []

    3.times do
      workers.push(User.where(role: "worker").sample.id)
    end

    job = Job.create!(name: Faker::Lorem.words(2).join(" "), datetime: Time.new(2018, month, days, rand(8..16), [00, 15, 30, 45].sample, 0), created_by: 1, client_id: user.id, notes: Faker::Lorem.sentence, workers: workers)
  end
end

# blog_posts
12.times do |n|
  post = BlogPost.create(user_id: [1, 2].sample, title: Faker::Lorem.words(rand(2..5)).join(" "), blog: Faker::Lorem.paragraphs(rand(3..7)).join("\n\n"))
  post.blog_pic = Rails.root.join("db/images/blog_pics/blog_pic_#{n+1}.jpg").open
  post.save!

  #comments
  rand(1..5).times do
    comment = Comment.create!(user_id: User.where(role: "client").sample.id , comment: Faker::Lorem.sentences(rand(1..3)).join(" "), blog_post_id: post.id)
  end
end

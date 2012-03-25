namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!( name: "Simon Clark",
                  email: "s@bosh.me",
                  password: "chitlands",
                  password_confirmation: "chitlands")
    admin.toggle!(:admin)

    User.create!( name: "Kimberly Harwood",
                  email: "kimberly_harwood@hotmail.com",
                  password: "foobar",
                  password_confirmation: "foobar")
    User.create!( name: "Example User",
                  email: "example@railstutorial.org",
                  password: "foobar",
                  password_confirmation: "foobar")
                  
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
    
    users = User.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      url = Faker::Internet.domain_name
      users.each { |user| user.posts.create!(content: content, url: url)}
    end    
  end        
end
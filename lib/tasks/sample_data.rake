namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Administrator",
                 email: "admin@admin.com",
                 password: "111111",
                 password_confirmation: "111111",
                 admin: true)
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
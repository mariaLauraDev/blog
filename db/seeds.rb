# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.where(email: "marialauradev@gmail.com").first_or_initialize
user.update(password: "password", password_confirmation: "password")

BlogPost.create(
  title: "Hello, World!",
  content: "This is my first blog post. I'm so excited to share my thoughts with the world!",
  published_at: Time.current
)

BlogPost.create(
  title: "Goodbye, World!",
  content: "This is my last blog post. I'm so sad to say goodbye to the world!",
  published_at: Time.current
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 @editor = User.create(email: "edizord@example.com", password: "pass1234", password_confirmation: "pass1234", role: "editor")

 @author = User.create(email: "authizord@example.com", password: "pass1234", password_confirmation: "pass1234", role: "author")

10.times do
  @post = Post.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraphs, published: false, author_id: @editor.id)
end


require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end 
users = User.all

 
50.times do 
  Post.create!(
    user:   users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all
 
100.times do
  Comment.create!(
    #users: users.sample,  #we have not yet associated Users with Comments.
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

post = Post.where(title: "My special title").first 

unless post
  Post.create(title: "My special title")
end

comment = Comment.where(body: "Some long body here").first

unless comment
  Comment.create(body: "Some long body here")
end 
 
user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'jamalehgyulay@gmail.com',
  password: 'brahma19'
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


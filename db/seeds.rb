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

15.times do
  Topic.create!(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end 
topics = Topic.all

 
50.times do 
  Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
  )
end
posts = Post.all

50.times do
  Summary.create!(
    post: posts.sample,
    body:  Faker::Lorem.paragraph
  )
end 
summaries = Summary.all
 
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
 
admin = User.new(
  name:      'Admin User',
  email:     'admin@example.com',
  password:  'helloworld',
  role:      'admin'
)
admin.skip_confirmation!
admin.save!

moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

member = User.new(
  name:       'Member User',
  email:      'member@example.com',
  password:   'helloworld'
)
member.skip_confirmation!
member.save!


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


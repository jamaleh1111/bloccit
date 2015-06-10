require 'faker'
 
50.times do 
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
posts = Post.all
 
100.times do
  Comment.create!(
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
 
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


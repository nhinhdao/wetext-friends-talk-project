
a = User.create(username: "robindao", email: "nhinhdao.vn@gmail.com", image: Faker::Avatar.image, password: 'nhinh12345', password_confirmation: 'nhinh12345')

9.times do |account|
  username = Faker::Internet.unique.username
  email = Faker::Internet.unique.email(username)
  image = Gravatar.new("#{email}").image_url + '?d=wavatar'
  password = 'nhinh12345'
  User.create(username: username, email: email, image: image, password: password, password_confirmation: password)
end


User.take(5).each do |user|
  pcontent = Faker::GameOfThrones.quote
  user.posts.create(pcontent: pcontent)
end


friends = User.all[1..5]
for fr in friends do
  mcontent1 = Faker::Community.quotes
  mcontent2 = Faker::SiliconValley.quote
  Connection.create(user: a, friend: fr)
  Connection.create(user: fr, friend: a)
  Message.create(mcontent: mcontent1, user: a, friend: fr)
  Message.create(mcontent: mcontent2, user: fr, friend: a)
end

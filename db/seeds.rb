
a = User.create(username: "robindao", email: "nhinhdao.vn@gmail.com", password: 'nhinh12345')

9.times do |account|
  username = Faker::Internet.unique.username
  email = Faker::Internet.unique.email(username)
  password = 'nhinh12345'
  User.create(username: username, email: email, password: password)
end


User.take(5).each do |user|
  pcontent = Faker::Community.quotes
  user.posts.create(pcontent: pcontent)
end


friends = User.all[1..5]
friends.each do |fr|
  mcontent1 = Faker::Community.quotes
  mcontent2 = Faker::HowIMetYourMother.quote
  Connection.create(user: a, friend: fr)
  Connection.create(user: fr, friend: a)
  Message.create(mcontent: mcontent1, user: a, friend: fr)
  Message.create(mcontent: mcontent2, user: fr, friend: a)
end

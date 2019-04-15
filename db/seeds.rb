
a = User.create(username: "robindao", email: "robin.frvn@gmail.com", image: 'https://i.imgur.com/vBHAwZo.jpg?1', password: 'nhinh12345', password_confirmation: 'nhinh12345')

User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/UpkwvqX.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/zGojDXh.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/JLSppzh.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/1KnRByb.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/o6udarW.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/PTVsCbl.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/xESh5uq.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/SyBpaM4.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.imgur.com/nIeUP44.png", password: 'nhinh12345', password_confirmation: 'nhinh12345')

user_posts = [
  "I admire smart and successful people. I build my career with a self-discipline and motivated mindset.",
  'My motivation to learn more comes from this statement: "Everybody you will ever meet knows something you don\'t" (Bill Nye)',
  "I often feel so pressure talking to smart people. I can't help but comparing myself to them and thinking I would want to be like them. I constantly look for chances to learn more to build a better version of myself. I want to be recognized.",
  "Coding and problem solving is my favorite brain training methods.",
  "I belive that Technology is a great tool to bring our visions to life. It is the future, my future",
  "The world we live in has so much to learn and to me, Technology is a great start.",
  "I live by the quote in Bible: 'Ask, and it will be given you. Seek, and you will find. Knock, and it will be opened for you.' - Matthew 7:7",
  "I grew up in a poor family in a poor country. It has taught me a great deal of helping myself and finding my own way to thrive.",
  "I love working with computer but I always thought women won't be as good as men in Technology aspect. That thought has stopped me from pursueing a degree in Computer Science but going for Hospitality Management.",
  "If I could turn back time, I would choose to learn more about Computer Science a lot earlier.",
]

User.all.each_with_index do |user, index|
  user.posts.create(content: user_posts[index])
end


friends = User.all[1..5]
for fr in friends do
  mcontent1 = Faker::Movie.quote
  mcontent2 = Faker::Movie.quote
  Connection.create(user: a, friend: fr)
  Connection.create(user: fr, friend: a)
  Message.create(content: mcontent1, user: a, friend: fr)
  Message.create(content: mcontent2, user: fr, friend: a)
end

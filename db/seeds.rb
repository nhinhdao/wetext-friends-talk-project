
a = User.create(username: "robindao", email: "robin.frvn@gmail.com", image: 'https://i.imgur.com/vBHAwZo.jpg', password: 'nhinh12345', password_confirmation: 'nhinh12345')

User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.pinimg.com/originals/e9/76/96/e976960bc23eec094b63132948d7df7c.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Baby_Face.JPG/220px-Baby_Face.JPG", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.laoistoday.ie/wp-content/uploads/2019/01/b1e02322b615a3b490bfc21a85b0d6cd.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://cdn2.momjunction.com/wp-content/uploads/2014/05/Popular-Baby-Boy-Names-With-Meanings.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://img4.zergnet.com/3106227_300.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "http://www.bounty.com/~/media/3aa3165f5be5457fa7b95d092e087c76.ashx?la=en", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.etsystatic.com/5305214/r/il/82c84f/1123418855/il_570xN.1123418855_5kak.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://d2o8aci180d5d9.cloudfront.net/main/highres/p/46441_oshires.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.boldsky.com/img/2012/10/x30-baby.jpg.pagespeed.ic.qdK8mlz28z.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')

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
  mcontent1 = Faker::GameOfThrones.quote
  mcontent2 = Faker::SiliconValley.quote
  Connection.create(user: a, friend: fr)
  Connection.create(user: fr, friend: a)
  Message.create(content: mcontent1, user: a, friend: fr)
  Message.create(content: mcontent2, user: fr, friend: a)
end

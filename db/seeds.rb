
a = User.create(username: "robindao", email: "nhinhdao.vnn@gmail.com", image: 'https://nameberry.com/blog/wp-content/uploads/2016/10/shutterstock_464300804-776x600.jpg', password: 'nhinh12345', password_confirmation: 'nhinh12345')

User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.pinimg.com/originals/e9/76/96/e976960bc23eec094b63132948d7df7c.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Baby_Face.JPG/220px-Baby_Face.JPG", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.laoistoday.ie/wp-content/uploads/2019/01/b1e02322b615a3b490bfc21a85b0d6cd.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://cdn2.momjunction.com/wp-content/uploads/2014/05/Popular-Baby-Boy-Names-With-Meanings.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://img4.zergnet.com/3106227_300.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "http://www.bounty.com/~/media/3aa3165f5be5457fa7b95d092e087c76.ashx?la=en", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.etsystatic.com/5305214/r/il/82c84f/1123418855/il_570xN.1123418855_5kak.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://d2o8aci180d5d9.cloudfront.net/main/highres/p/46441_oshires.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.boldsky.com/img/2012/10/x30-baby.jpg.pagespeed.ic.qdK8mlz28z.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')


User.all.each do |user|
  pcontent = Faker::Community.quotes
  user.posts.create(content: pcontent)
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

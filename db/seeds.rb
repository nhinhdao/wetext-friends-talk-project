
a = User.create(username: "robindao", email: "nhinhdao.vnn@gmail.com", image: 'http://parenthoodbank.com/wp-content/uploads/2015/07/crying-baby-009-620x350.jpg', password: 'nhinh12345', password_confirmation: 'nhinh12345')

User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.pinimg.com/originals/e9/76/96/e976960bc23eec094b63132948d7df7c.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqwkvrYW9lv1bSSb1PmEQBOF5sst2bN7FlgCpglLfLPu9UmPGl", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "http://supergirlsnowpro.com/wp-content/uploads/sites/19/2018/03/Payton-Bacca-headshot_sm.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.pinimg.com/236x/11/11/37/111137dd0511f1bbc9860ff3268277e5--the-blacklist--megan-boone.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.visualelementmedia.com/wp-content/uploads/2015/04/person-4-400x629.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://www.ase.org/sites/ase.org/files/mark_del_rosso_0.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://i.etsystatic.com/5305214/r/il/82c84f/1123418855/il_570xN.1123418855_5kak.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://d2o8aci180d5d9.cloudfront.net/main/highres/p/46441_oshires.jpg", password: 'nhinh12345', password_confirmation: 'nhinh12345')
User.create(username: Faker::Internet.unique.username, email: Faker::Internet.email, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3C9yHeqlvqyoNbJ2blNUMv1tpuyiu9sD8i1aNKvE_9HijONA8", password: 'nhinh12345', password_confirmation: 'nhinh12345')


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

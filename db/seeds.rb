require 'open-uri'

puts "Creating the seed file"
puts "Wiping previous seeds"
Message.destroy_all
Chatroom.destroy_all
Hike.destroy_all
User.destroy_all

puts "Adding 5 users"
user1_photo = URI.open("https://thumbs.dreamstime.com/b/middle-age-curly-hair-hiker-woman-hiking-wearing-backpack-water-canteen-using-binoculars-looking-to-side-relax-profile-pose-218285158.jpg")
user2_photo = URI.open("https://media.licdn.com/dms/image/C5603AQHXCY4Vpc7LbA/profile-displayphoto-shrink_800_800/0/1632761237696?e=2147483647&v=beta&t=gQ8KczlCJlVbh7njtZUaa1lhlyhew7ab09s6akl7CQ0")
user3_photo = URI.open("https://media.cnn.com/api/v1/images/stellar/prod/191109234431-california-hiker-mountain-top.jpg?q=w_1600,h_1528,x_0,y_0,c_fill")
user4_photo = URI.open("https://cdn1.socialhiker.net/wp-content/uploads/avatars/16914/63c644a574f44-bpfull.jpg")
user5_photo = URI.open("https://pbs.twimg.com/profile_images/1301644507658596352/YbKKFSOR_400x400.jpg")

user1 = User.new(first_name:'Jeremy', last_name:'Hikkerson', email:'test@test.com', password: 123456, description:'A VERY generic person with limited personality.', user_photo_url:'')
user2 = User.new(first_name:'Luke', last_name:'Sherman', email:'lukesherman@test.com', password: 123456 , description:'Hello I am Luke Sherman', user_photo_url:'')
user3 = User.new(first_name:'Ben', last_name:'Heyman', email:'benheyman@test.com', password: 123456, description:'Hello I am Ben Heyman', user_photo_url:'')
user4 = User.new(first_name:'Camille', last_name:'Laporte', email:'camillelaporte@test.com', password: 123456, description:'Hello I am Camille Laporte', user_photo_url:'')
user5 = User.new(first_name:'Linnea', last_name:'Jonsson', email:'linneajonsson@test.com', password: 123456, description:'Hello I am Linnea Jonsson', user_photo_url:'')

user1.photo.attach(io: user1_photo, filename: "nes.png", content_type: "image/png")
user1.save!
user2.photo.attach(io: user2_photo, filename: "nes.png", content_type: "image/png")
user2.save!
user3.photo.attach(io: user3_photo, filename: "nes.png", content_type: "image/png")
user3.save!
user4.photo.attach(io: user4_photo, filename: "nes.png", content_type: "image/png")
user4.save!
user5.photo.attach(io: user5_photo, filename: "nes.png", content_type: "image/png")
user5.save!

puts "Finished Creating Users"
puts "Adding some Hikes"

hike1_photo = URI.open('https://img.redbull.com/images/c_crop,x_0,y_0,h_2000,w_3000/c_fill,w_2060,h_1370/q_auto:low,f_auto/redbullcom/2018/08/14/d9d28f74-3e2f-4d54-b7c0-6cabd087da47/loch-etchachan-cairngorm')
hike1 = Hike.new(
  hike_name:"Ben Macdui Walk",
  hike_description:"A roller coaster of a route where you start high, following a series of ascents and descents throughout the day. Head up alongside the main ski run to the summit of Cairngorm, taking in the views of the Rothiemurchus forest and Aviemore beyond. From here, follow the path that takes you down through Coire Raibeirt to the shores of Loch Avon, and up the other side to meet Loch Etchachan.",
  difficulty: "Easy 🟢",
  distance:12,
  duration: 3.06e+7,
  max_people: 3,
  hike_date: '2023-03-03',
  hike_confirmed: true,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Cairngorms National Park"
)
hike1.photo.attach(io: hike1_photo, filename: "nes.png", content_type: "image/png")
hike1.save!

hike2_photo = URI.open('https://britishlandscapesphotography.co.uk/wp-content/uploads/2021/10/A90A1678.jpg')
hike2 = Hike.new(
  hike_name:"The Glyders in Snowdonia",
  hike_description:"This is a hard day, but well worth it for the photo opportunities. We can start at Ogwen Cottage and head behind the buildings and around the east side of Llyn Idwal. There is a steep climb up Devil’s Kitchen. Keep climbing up and you’ll be at the top of the highest summit of the day at 1001m. From here you head to The Castle of the Winds rock formation and then onto the boulder collection that makes up the Glyder Fach summit.",
  difficulty: "Medium 🟡",
  distance:7,
  duration: 1.8e+7,
  max_people:8,
  hike_date: '2023-05-04',
  hike_confirmed: true,
  hike_completed: false,
  user_id: user2.id,
  starting_point: "Snowdonia"
)
hike2.photo.attach(io: hike2_photo, filename: "nes.png", content_type: "image/png")
hike2.save!

hike3_photo = URI.open('https://img.redbull.com/images/c_crop,x_0,y_0,h_3024,w_4032/c_fill,w_2060,h_1545/q_auto:low,f_auto/redbullcom/2018/08/14/0f8c6588-95fa-4f97-b7df-14556c3d9702/old-harry-rocks')
hike3 = Hike.new(
  hike_name:"Harrys Rock Walk",
  hike_description:"This walk takes in the most famous landmark on this stretch of Dorset coast – Old Harry Rocks. Starting at Knoll Beach we will head south, follow the coastline and will pass, features from World War Two and then Old Harry Rocks come into view. The white chalk cliffs are highlighted against the blue sea on a sunny day and you can hear the waves slamming into the caves down below the cliffs.",
  difficulty: "Easy 🟢",
  distance:10,
  duration: 1.44e+7,
  max_people: 5,
  hike_date: '2024-01-01',
  hike_confirmed: true,
  hike_completed: true,
  user_id: user3.id,
  starting_point: "Isle of Purbeck"
)
hike3.photo.attach(io: hike3_photo, filename: "nes.png", content_type: "image/png")
hike3.save!

hike4_photo = URI.open('https://img.redbull.com/images/c_crop,x_0,y_0,h_2448,w_3264/c_fill,w_2060,h_1545/q_auto:low,f_auto/redbullcom/2018/08/14/11ef7e2f-a529-4b3c-95ac-deb06a9c4640/view-from-whernside')
hike4 = Hike.new(
  hike_name: "The Three Peaks",
  hike_description: "Climbing the three highest peaks in Yorkshire it’s a walk that includes over 1600m of ascent so you will need to be fit if poss. The usual starting point for this walk is Horton in Ribblesdale but if you want to avoid the crowds we can start at Chapel-le-Dale and proceed in that direction.",
  difficulty: "Hard 🔴",
  distance: 24,
  duration: 4.32e+7,
  max_people: 6,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Ingleton, Yorkshire"
)
hike4.photo.attach(io: hike4_photo, filename: "nes.png", content_type: "image/png")
hike4.save!

hike5_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_hereford-wye-shutterstock_201737375_fe851ba0ae.jpeg')
hike5 = Hike.new(
  hike_name: "Wye Valley Walk",
  hike_description: " It's the perfect place for hill and river walks that showcase the UK's lovely rural charms. Plump for the Wye Valley Walk, a long-distance national trail that follows the course of the River Wye." ,
  difficulty: "Medium 🟡",
  distance: 18,
  duration: 4.32e+7,
  max_people: 5,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user3.id,
  starting_point: "Ross-on-Wye, Herefordshire"
)
hike5.photo.attach(io: hike5_photo, filename: "nes.png", content_type: "image/png")
hike5.save!

hike6_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_Portrush-Northern-Ireland-shutterstock_728344141_7d11aa81c9.jpeg')
hike6 = Hike.new(
  hike_name: "Causeway Coast",
  hike_description: "Enthusiastic ramblers who enjoy multi-day hikes can walk the entire section of the Causeway Coast Way with relative ease",
  difficulty: "Easy 🟢",
  distance: 6.5,
  duration: 4.32e+7,
  max_people: 10,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user5.id,
  starting_point: "Portrush, Coleraine, Nothern Island"
)
hike6.photo.attach(io: hike6_photo, filename: "nes.png", content_type: "image/png")
hike6.save!

hike7_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_Teignmouth-shutterstock_121335574_c2bf238d0d.jpeg')
hike7 = Hike.new(
  hike_name: "Railway Walk",
  hike_description: "If you're a fan of bracing seaside walks, then the impressive South West Coast Path is the one for you.",
  difficulty: "Easy 🟢",
  distance: 4.7,
  duration: 4.32e+7,
  max_people: 6,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Dawlish Warren, Devon, England"
)
hike7.photo.attach(io: hike7_photo, filename: "nes.png", content_type: "image/png")
hike7.save!

hike8_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_Pyg%20track-snowdonia-shutterstock_1437725384_07770f60e6.jpeg')
hike8 = Hike.new(
  hike_name: "Pyg Track Intense Hike!",
  hike_description: "This is an incredibly scenic route that's suitable for beginner day hikers as it's not too challenging or technical",
  difficulty: "Medium 🟡",
  distance: 7,
  duration: 4.32e+7,
  max_people: 3,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user2.id,
  starting_point: "Snowdonia National Park, Wales"
)
hike8.photo.attach(io: hike8_photo, filename: "nes.png", content_type: "image/png")
hike8.save!

hike9_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_Scafell_Pike-shutterstock_1594703968_4ae9ad6e0c.jpeg')
hike9 = Hike.new(
  hike_name: "Scafell Pike (Really Intense)",
  hike_description: "a serious peak in the Lake District that's looked after by the National Trust. The climb is a challenging day hike and should never be underestimated. This is definitely not a route for “have-a-go” hikers, as the steep and rocky terrain will require experience, proper equipment and technical skills.",
  difficulty: "Hard 🔴",
  distance: 7,
  duration: 4.32e+7,
  max_people: 3,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user3.id,
  starting_point: "Lake District, Cumbria"
)
hike9.photo.attach(io: hike9_photo, filename: "nes.png", content_type: "image/png")
hike9.save!

hike10_photo = URI.open('https://deih43ym53wif.cloudfront.net/large_Worm-Head-Wales-shutterstock_1144155548_f042c503e7.jpeg')
hike10 = Hike.new(
  hike_name: "Worms Head Walk",
  hike_description: "Just a really nice walk for someone to enjoy with me!",
  difficulty: "Medium 🟡",
  distance: 6,
  duration: 4.32e+7,
  max_people: 6,
  hike_confirmed: false,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Wales Coast Path"
)
hike10.photo.attach(io: hike10_photo, filename: "nes.png", content_type: "image/png")
hike10.save!

puts "Created Hikes"
puts "Creating Requests"

Request.create!(user_id: user1.id, hike_id: hike2.id)
Request.create!(user_id: user1.id, hike_id: hike3.id)
Request.create!(user_id: user2.id, hike_id: hike1.id)
Request.create!(user_id: user3.id, hike_id: hike1.id)
Request.create!(user_id: user5.id, hike_id: hike8.id)
Request.create!(user_id: user2.id, hike_id: hike6.id)
Request.create!(user_id: user1.id, hike_id: hike9.id)



puts "Created Requests"

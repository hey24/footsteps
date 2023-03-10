require 'open-uri'

puts "Creating the seed file"
puts "Wiping previous seeds"
Hike.destroy_all
User.destroy_all


puts "Adding 5 users"
user1 = User.create(first_name:'test', last_name:'test', email:'test@test.com', password: 123456, description:'A VERY generic person with limited personality.', user_photo_url:'')
user2 = User.create(first_name:'Luke', last_name:'Sherman', email:'lukesherman@test.com', password: 123456 , description:'Hello I am Luke Sherman', user_photo_url:'')
user3 = User.create(first_name:'Ben', last_name:'Heyman', email:'benheyman@test.com', password: 123456, description:'Hello I am Ben Heyman', user_photo_url:'')
user4 = User.create(first_name:'Camille', last_name:'Laporte', email:'camillelaporte@test.com', password: 123456, description:'Hello I am Camille Laporte', user_photo_url:'')
user5 = User.create(first_name:'Linnea', last_name:'Jonsson', email:'linneajonsson@test.com', password: 123456, description:'Hello I am Linnea Jonsson', user_photo_url:'')

puts "Finished Creating Users"
puts "Adding some Hikes"

hike1_photo = URI.open('https://img.redbull.com/images/c_crop,x_0,y_0,h_2000,w_3000/c_fill,w_2060,h_1370/q_auto:low,f_auto/redbullcom/2018/08/14/d9d28f74-3e2f-4d54-b7c0-6cabd087da47/loch-etchachan-cairngorm')
hike1 = Hike.new(
  hike_name:"Ben Macdui, Cairngorms National Park",
  hike_description:"A roller coaster of a route where you start high, following a series of ascents and descents throughout the day. Start at the car park at Coire Cas and head up alongside the main ski run to the summit of Cairngorm, taking in the views of the Rothiemurchus forest and Aviemore beyond. From here, follow the path that takes you down through Coire Raibeirt to the shores of Loch Avon, and up the other side to meet Loch Etchachan.
  Now it’s time to climb again, this time to the massive cairn marking the summit of Ben Macdui, the second highest mountain in Britain. From here you can be rewarded on a clear day with views of the west side of the Lairig Ghru, Carn Toul and Braeriach. To descend, follow the path north which brings you out alongside Coire an Lochain and back to the car park.",
  difficulty: "easy",
  distance:12,
  duration: 3.06e+7,
  max_people:20,
  hike_date: '2023-03-20',
  hike_confirmed: true,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Cairngorms National Park"
)
hike1.photo.attach(io: hike1_photo, filename: "nes.png", content_type: "image/png")
hike1.save!

hike2_photo = URI.open('https://www.wanderingwelshgirl.com/wp-content/uploads/2020/10/IMG_4780-2048x1536.jpg?ezimgfmt=ng:webp/ngcb2')
hike2 = Hike.new(
  hike_name:"The Glyders, Snowdonia",
  hike_description:"This is a deceptively hard day, but well worth it for the photo opportunities. Leave your car at Ogwen Cottage and head behind the buildings and around the east side of Llyn Idwal. The steep climb up Devil’s Kitchen will take your breath away. Keep climbing up the scree and you’ll be at the top of the highest summit of the day at 1001m. From here you head to The Castle of the Winds rock formation and then onto the boulder collection that makes up the Glyder Fach summit. Just ahead on the plateau is the iconic Cantilever stone - a must for the photo collection.",
  difficulty: "medium",
  distance:7,
  duration: 1.8e+7,
  max_people:10,
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
  hike_name:"Old Harry Rocks, Isle of Purbeck",
  hike_description:"The Jurassic Coastline is a World Heritage Site. This walk takes in the most famous landmark on this stretch of Dorset coast – Old Harry Rocks. Starting at Knoll Beach and heading south, follow the coastline and you’ll pass pretty beach huts, features from World War Two and then Old Harry Rocks come into view. The white chalk cliffs are highlighted against the blue sea on a sunny day and if you listen above the breeze you can hear the waves slamming into the caves down below the cliffs.",
  difficulty: "easy",
  distance:10,
  duration: 1.44e+7,
  max_people:5,
  hike_date: '2024-01-01',
  hike_confirmed: true,
  hike_completed: false,
  user_id: user3.id,
  starting_point: "Isle of Purbeck"
)
hike3.photo.attach(io: hike3_photo, filename: "nes.png", content_type: "image/png")
hike3.save!

hike4_photo = URI.open('https://img.redbull.com/images/c_crop,x_0,y_0,h_2448,w_3264/c_fill,w_2060,h_1545/q_auto:low,f_auto/redbullcom/2018/08/14/11ef7e2f-a529-4b3c-95ac-deb06a9c4640/view-from-whernside')
hike4 = Hike.new(
  hike_name: "Yorkshire Three Peaks, Pennine Range",
  hike_description: "Climbing the three highest peaks in Yorkshire is no mean feat, it’s a walk that includes over 1600m of ascent so you will need to be fit. The three peaks form part of the Pennine Range. The usual starting point for this walk is Horton in Ribblesdale but if you want to avoid the crowds, particularly on a weekend, it is a good idea to start at Chapel-le-Dale and proceed in anti-clockwise direction.",
  difficulty: "hard",
  distance: 24,
  duration: 4.32e+7,
  max_people: 20,
  hike_confirmed: true,
  hike_completed: false,
  user_id: user1.id,
  starting_point: "Pennine Range"
)
hike4.photo.attach(io: hike4_photo, filename: "nes.png", content_type: "image/png")
hike4.save!

puts "Created Hikes"

puts "Creating Requests"

request1 = Request.create!(
  user_id: user1.id,
  hike_id: hike2.id
)

request2 = Request.create!(
  user_id: user2.id,
  hike_id: hike1.id
)

request3 = Request.create!(
  user_id: user3.id,
  hike_id: hike1.id
)

request4 = Request.create!(
  user_id: user4.id,
  hike_id: hike2.id
)

puts "Created Requests"

puts "Creating the seed file"
puts "Wiping previous seeds"
User.destroy_all


puts "Adding 5 users"
user1 = User.create(first_name:'test', last_name:'test', email:'test@test.com', password: 123456, description:'A VERY generic person with limited personality.', user_photo_url:'')
user2 = User.create(first_name:'Luke', last_name:'Sherman', email:'lukesherman@test.com', password: 123456 , description:'Hello I am Luke Sherman', user_photo_url:'')
user3 = User.create(first_name:'Ben', last_name:'Heyman', email:'benheyman@test.com', password: 123456, description:'Hello I am Ben Heyman', user_photo_url:'')
user4 = User.create(first_name:'Camille', last_name:'Laporte', email:'camillelaporte@test.com', password: 123456, description:'Hello I am Camille Laporte', user_photo_url:'')
user5 = User.create(first_name:'Linnea', last_name:'Jonsson', email:'linneajonsson@test.com', password: 123456, description:'Hello I am Linnea Jonsson', user_photo_url:'')

puts "Finished Creating Users"
puts "Adding some Hikes"

hike1 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )
hike2 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )
hike3 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )
hike4 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )
hike5 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )
hike6 = Hike.create(hike_name:'', hike_description:'', hike_photo_url:'', difficulty: , distance: , duration: , max_people: , hike_date: , hike_confirmed: , hike_completed: , user_id: )

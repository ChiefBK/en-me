# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Location.delete_all
# Event.delete_all
# User.delete_all
# Comment.delete_all

location = Location.create(name: Faker::Address.community, address_line_one: Faker::Address.street_address, address_line_two: nil, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip)

event = Event.create(name: 'Beach BBQ!', starts_at: Faker::Time.between(from: DateTime.now + 5, to: DateTime.now + 20), location_id: location.id)


users = User.create([
                        {first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                        {first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, display_name: Faker::Superhero.name, email: Faker::Internet.email},
                    ])

comments = Comment.create([
                              {user_id: users[0].id, event_id: event.id, text: Faker::Lorem.sentence},
                              {user_id: users[1].id, event_id: event.id, text: Faker::Lorem.sentence},
                              {user_id: users[3].id, event_id: event.id, text: Faker::Lorem.sentence},
                              {user_id: users[4].id, event_id: event.id, text: Faker::Lorem.sentence},
                              {user_id: users[6].id, event_id: event.id, text: Faker::Lorem.sentence},
                              {user_id: users[9].id, event_id: event.id, text: Faker::Lorem.sentence},
                          ])

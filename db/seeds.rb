# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  Board.destroy_all

  fruits        = Board.create(id: 1, name: 'Fruits', resource_id: ('a'..'zz').to_a.sample(6).join, private: false)
  # Red fruits
  fruits.lists  << List.create(name: 'Red', position: 1)
  red_fruits    = fruits.lists.first.cards
  red_fruits    << Card.create(name: 'Apple', position: 1)
  red_fruits    << Card.create(name: 'Grape', position: 2)
  # Green fruits
  fruits.lists  << List.create(name: 'Green', position: 2)
  green_fruits  = fruits.lists.last.cards
  green_fruits  << Card.create(name: 'Avocado', position: 1)
  green_fruits  << Card.create(name: 'Lime', position: 2)

  cartoons = Board.create(id: 2, name: 'Cartoons', resource_id: ('a'..'zz').to_a.sample(6).join, private: false)
  # Aladdin
  cartoons.lists << List.create(name: 'Aladdin', position: 1)
  aladdin        = cartoons.lists.first.cards
  aladdin        << Card.create(name: 'I need to talk with Genie ', position: 1)
  aladdin        << Card.create(name: 'Need to get a new hat! Monkey stole my old one!', position: 2)
  # The Tick
  cartoons.lists << List.create(name: 'The Tick', position: 2)
  tick           = cartoons.lists.last.cards
  tick           << Card.create(name: 'HERO!', position: 1)
  tick           << Card.create(name: 'I AM!', position: 2)

  Board.create(id: 3, name: 'Secrets', resource_id: Rails.application.credentials.secret_resource_id, private: true)
end

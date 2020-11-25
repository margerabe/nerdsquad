require "open-uri"

#Destroy all current users when running this seed

#Adding Batman as first User
first = User.create(email: "b@t.man", username: "batman", password:'123456')

#Creating Monopoly

game = Game.new(
  name: 'Monopoly',
  description: "Establish a monopoly to strangle your opponents to death like it's Cuba!",
  number_of_players: 20,
  user: User.first,
  saved: true
)
game.save
board = Board.new(
  width: 500,
  height: 500,
  posX: 500,
  posY: 150,
  angle: 0,
  game: game
)
board_image = URI.open('#')
board.save
board.photo.attach(io:board_image, filename:"board-#{board.id}-image")

properties = CardDeck.new(
  name: 'properties',
  posX: 1025,
  posY: 175,
  blind?: false,
  height: 200,
  width: 120,
  angle: 0,
  game: game
)
properties.save
properties_hash = { 'Baltic Avenue'=> , 'Reading Railroad', 'Oriental Avenue', 'Vermont Avenue', 'Connecticut Avenue',
'St. Charles Place', 'Electric Company', 'States Avenue', 'States Avenue',  'Virginia Avenue', 'Pennsylvania Railroad',
'St. James Place', 'Tennessee Avenue', 'New York Avenue', 'Kentucky Avenue', 'Indiana Avenue', 'Illnois Avenue',
'B. & O. Railroad', 'Atlantic Avenue', 'Ventura Avenue', 'Water Works', 'Marvin Gardens', 'Pacific Avenue',
'North Carolina Avenue', 'Pennsylvania Avenue', 'Shortline', 'Boardwalk' }

properties_position = (1..27).to_a

properties_urls = %w[]

27.times do
  property = Card.new(
    card_deck: properties,
    name: properties_name.pop,
    visibility: 'visible',
    position: properties_position.pop,
    angle: 0,
    width: 120,
    height: 200
  )
  card_image = properties_urls.pop
  card.photo.attach(io:card_image, filename:"card-#{card.name}-image")
end

chance = CardDeck.new(
  name: 'chance',
  posX: 1025,
  posY: 175,
  blind?: true,
  height: 200,
  width: 120,
  angle: 0,
  game: game
)



card1  = Card.new(name: 'Baltic Avenue',         visibility: 'visible', card_deck: properties, position: 1,  angle: 0)
card1.photo.attach(io:card1_image, filename:"board-#{card1.id}-image")
card2  = Card.new(name: 'Reading Railroad',      visibility: 'visible', card_deck: properties, position: 2,  angle: 0)
card2.photo.attach(io:card2_image, filename:"board-#{card2.id}-image")
card3  = Card.new(name: 'Oriental Avenue',       visibility: 'visible', card_deck: properties, position: 3,  angle: 0)
card3.photo.attach(io:card3_image, filename:"board-#{card3.id}-image")
card4  = Card.new(name: 'Vermont Avenue',        visibility: 'visible', card_deck: properties, position: 4,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card5  = Card.new(name: 'Connecticut Avenue',    visibility: 'visible', card_deck: properties, position: 5,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card6  = Card.new(name: 'St. Charles Place',     visibility: 'visible', card_deck: properties, position: 6,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card7  = Card.new(name: 'Electric Company',      visibility: 'visible', card_deck: properties, position: 7,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card8  = Card.new(name: 'States Avenue',         visibility: 'visible', card_deck: properties, position: 8,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card9  = Card.new(name: 'Virginia Avenue',       visibility: 'visible', card_deck: properties, position: 9,  angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card10 = Card.new(name: 'Pennsylvania Railroad', visibility: 'visible', card_deck: properties, position: 10, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card11 = Card.new(name: 'St. James Place',       visibility: 'visible', card_deck: properties, position: 11, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card12 = Card.new(name: 'Tennessee Avenue',      visibility: 'visible', card_deck: properties, position: 12, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card13 = Card.new(name: 'New York Avenue',       visibility: 'visible', card_deck: properties, position: 13, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card14 = Card.new(name: 'Kentucky Avenue',       visibility: 'visible', card_deck: properties, position: 14, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card15 = Card.new(name: 'Indiana Avenue',        visibility: 'visible', card_deck: properties, position: 15, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card16 = Card.new(name: 'Illnois Avenue',        visibility: 'visible', card_deck: properties, position: 16, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card17 = Card.new(name: 'B. & O. Railroad',      visibility: 'visible', card_deck: properties, position: 17, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card18 = Card.new(name: 'Atlatic Avenue',        visibility: 'visible', card_deck: properties, position: 18, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card19 = Card.new(name: 'Ventura Avenue',        visibility: 'visible', card_deck: properties, position: 19, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card20 = Card.new(name: 'Water Works',           visibility: 'visible', card_deck: properties, position: 20, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card21 = Card.new(name: 'Marvin Gardens',        visibility: 'visible', card_deck: properties, position: 21, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card22 = Card.new(name: 'Pacific Avenue',        visibility: 'visible', card_deck: properties, position: 22, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card23 = Card.new(name: 'North Carolina Avenue', visibility: 'visible', card_deck: properties, position: 23, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card24 = Card.new(name: 'Pennsylvania Avenue',   visibility: 'visible', card_deck: properties, position: 24, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card25 = Card.new(name: 'Shortline',             visibility: 'visible', card_deck: properties, position: 25, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card26 = Card.new(name: 'Park Place',            visibility: 'visible', card_deck: properties, position: 26, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
card27 = Card.new(name: 'Boardwalk',             visibility: 'visible', card_deck: properties, position: 27, angle: 0)
card.photo.attach(io:card_image, filename:"board-#{card.id}-image")
require "open-uri"

#Destroy all current users when running this seed

#Adding Batman as first User
first = User.create(email: "b@t.man", username: "batman", password:'123456')
second = User.create(email: "r@b.in", username: "robin", password:'123456')

#Creating Monopoly

game = Game.new(
  name: 'Monopoly',
  description: "Establish a monopoly to strangle your opponents to death like it's Cuba!",
  number_of_players: 20,
  user: first,
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
properties_hash = { 'Baltic Avenue' => 'assets/monopoly/baltic',
'Reading Railroad' => 'assets/monopoly/baltic',
'Oriental Avenue' => 'assets/monopoly/baltic',
 'Vermont Avenue' => 'assets/monopoly/baltic',
 'Connecticut Avenue' => 'assets/monopoly/baltic',

'St. Charles Place' => 'assets/monopoly/baltic',
 'Electric Company' => 'assets/monopoly/baltic',
 'States Avenue' => 'assets/monopoly/baltic',
 'States Avenue' => 'assets/monopoly/baltic',
  'Virginia Avenue' => 'assets/monopoly/baltic',
 'Pennsylvania Railroad' => 'assets/monopoly/baltic',

'St. James Place' => 'assets/monopoly/baltic',
 'Tennessee Avenue' => 'assets/monopoly/baltic',
 'New York Avenue' => 'assets/monopoly/baltic',
 'Kentucky Avenue' => 'assets/monopoly/baltic',
 'Indiana Avenue' => 'assets/monopoly/baltic',
 'Illnois Avenue' => 'assets/monopoly/baltic',

'B. & O. Railroad' => 'assets/monopoly/baltic',
 'Atlantic Avenue' => 'assets/monopoly/baltic',
 'Ventura Avenue' => 'assets/monopoly/baltic',
 'Water Works' => 'assets/monopoly/baltic',
 'Marvin Gardens' => 'assets/monopoly/baltic',
 'Pacific Avenue' => 'assets/monopoly/baltic',

'North Carolina Avenue' => 'assets/monopoly/baltic',
 'Pennsylvania Avenue' => 'assets/monopoly/baltic',
 'Shortline' => 'assets/monopoly/baltic',
 'Boardwalk' }

properties_position = (1..27).to_a


properties_hash.keys.size.times do
  property = Card.new(
    card_deck: properties,
    name: properties_name.pop,
    visibility: 'visible',
    position: properties_position.pop,
    angle: 0,
    width: 120,
    height: 200
  )
  card_image = properties_hash[property]
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



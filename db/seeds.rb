PurchasedGame.destroy_all
Order.destroy_all
User.destroy_all
Photo.destroy_all
CoverPhoto.destroy_all
Game.destroy_all
# Testimonial.destroy_all

admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email

silver = Game.create(
  title: "The Silver of Burnt Grass",
  teaser: "In the wild west town of Burnt Grass, Wyoming, the discovery of a massive silver deposit has attracted a bunch of strange characters. Tonight they've all gathered at the Burnt Grass Saloon to wait for the first dividends from the town's mining collective to arrive-- or not. Characters include ranchers, preachers, politicians, bandits, bartenders, and lawmen.",
  included: "Invitations; rules; detailed character notes for 17 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Medium",
  notes: "The moderators The Silver of Burnt Grass should expect to spend at least a couple hours tracking down the appropriate props. Some, but not all, of this responsibility can be passed on to the players. The Silver of Burnt Grass uses an optional dueling mechanic that improves the game, but requires a fair amount of set-up. Little to no decoration is required, but the game is better in a suitably decorated space.",
  price: 100,
  player_min: 16,
  player_max: 20,
  play_time: 3,
  prep_time: 3
)

lady = Game.create(
  title: "Our Lady of Interplanetary Ascendance",
  teaser: "It's recruitment night at the remote compound of Our Lady of Interplanetary Ascendance, where true believers seclude themselves from the corruption of society and study the mysteries of the cosmos, and where they are definitely are not hiding a gigantic stash of illegal weapons for the coming apocalypse. Who will show up to be inducted? What are the mysteries? And why is so much of the house off limits to visitors and church members alike?",
  included: "Invitations; rules; detailed character notes for 12 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Difficult",
  notes: "Our Lady of Interplanetary Ascendance works best in a strange and immersive setting. Moderators should expect to do substantial redecorating. The moderators have roles in the game, as well, which ideally involve a small amount of memorization.",
  price: 100,
  player_min: 16,
  player_max: 20,
  play_time: 3,
  prep_time: 3
)

visconte = Game.create(
  title: "Visconte's Speakeasy",
  teaser: "Wise guys have been disappearing, and nobody can figure out why. The two major families are meeting to negotiate a truce and solve the murders. Of course, there are all kinds of different agendas, plus opportunistic hangers-on, cops, low-lives, and politicians, and that's just one person!",
  included: "Invitations; rules; detailed character notes for 12 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Medium",
  notes: "Not much is needed in the way of decoration, but there's a bit of involved prop work. This game is more prone to end in a shootout than others.",
  price: 100,
  player_min: 16,
  player_max: 20,
  play_time: 3,
  prep_time: 3
)

end_of_days = Game.create(
  title: "End of Days",
  teaser: "Antiquities auctions always draw a strange crowd, but this one is off the charts. Maybe it's that strange Syrian scroll that seems to leave a trail of bloody corpses in its wake. It must be very valuable. It couldn't possibly actually trigger the apocalypse. Could it?!",
  included: "Invitations; rules; detailed character notes for 22 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Very Difficult",
  notes: "Honestly, End of Days is nuts. There are lots of props and some complicated mechanics. We're not saying it's buggy, just that it needs to be played a few more times before we can promise it's not buggy. That's why we're selling it cheap.",
  price: 100,
  player_min: 16,
  player_max: 20,
  play_time: 3,
  prep_time: 3
)

cuba_libre = Game.create(
  title: "Cuban Missile Crisis: Again!",
  teaser: "Oops! Somebody left a few nuclear missiles in Cuba and their set to obliterate the eastern seaboard at midnight! Leaders from around the world converge to figure out how to avoid nuclear annihilation, or possibly encourage it. Bust out your tinfoil hats and prep your bunkers, because this is bound to be an exciting night.",
  included: "Invitations; rules; detailed character notes for 25 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Medium",
  notes: "Cuban Missile Crisis: Again! requires some creative prop work, but the decorating is not too hard and it works with a wide variety of player configurations (12 to 25 people)",
  price: 100,
  player_min: 16,
  player_max: 20,
  play_time: 3,
  prep_time: 3
)

User.destroy_all
Photo.destroy_all
# Testimonial.destroy_all
Game.destroy_all

silver = Game.create(
  title: "The Silver of Burnt Grass",
  teaser: "In the wild west town of Burnt Grass, Wyoming, the discovery of a massive silver deposit has attracted a bunch of strange characters. Tonight they've all gathered at the Burnt Grass Saloon to wait for the first dividends from the town's mining collective to arrive-- or not. Characters include ranchers, preachers, politicians, bandits, bartenders, and lawmen.",
  included: "Invitations; rules; detailed character notes for 17 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Medium",
  notes: "The moderators The Silver of Burnt Grass should expect to spend at least a couple hours tracking down the appropriate props. Some, but not all, of this responsibility can be passed on to the players. The Silver of Burnt Grass uses an optional dueling mechanic that improves the game, but requires a fair amount of set-up. Little to no decoration is required, but the game is better in a suitably decorated space.",
  price: 2500
  )

lady = Game.create(
  title: "Our Lady of Interplanetary Ascendance",
  teaser: "It's recruitment night at the remote compound of Our Lady of Interplanetary Ascendance, where true believers seclude themselves from the corruption of society and study the mysteries of the cosmos, and where they are definitely are not hiding a gigantic stash of illegal weapons for the coming apocalypse. Who will show up to be inducted? What are the mysteries? And why is so much of the house off limits to visitors and church members alike?",
  included: "Invitations; rules; detailed character notes for 12 different roles, including backstory, goals, and specific knowledge about other characters; printable paper props; decorating and site layout suggestions; detailed instructions for moderators; prop list",
  not_included: "Most physical materials, including character props",
  difficulty: "Difficult",
  notes: "Our Lady of Interplanetary Ascendance works best in a strange and immersive setting. Moderators should expect to do substantial redecorating. The moderators have roles in the game, as well, which ideally involve a small amount of memorization.",
  price: 2500
  )

admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email

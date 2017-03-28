# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Doc.delete_all

User.create(email:'julia@gmail.com', password: "123456")
User.last.docs.create(title: 'Synth', content: "Synth try-hard fam, slow-carb duis excepteur nisi quis ethical selvage delectus put a bird on it chartreuse enamel pin. Est activated charcoal intelligentsia, next level trust fund mixtape duis consectetur PBR&B gluten-free jean shorts hammock craft beer kogi. Gochujang beard hot chicken, raw denim humblebrag tousled skateboard williamsburg. Cardigan VHS iPhone aute mumblecore waistcoat single-origin coffee meditation heirloom, eiusmod pok pok freegan ennui. Fanny pack lo-fi hella, green juice helvetica adipisicing nihil skateboard aliquip sustainable la croix portland. Raclette voluptate pickled, woke letterpress aute nostrud. Bespoke offal veniam asymmetrical pickled etsy, retro crucifix scenester neutra tote bag vero kale chips photo booth lo-fi.")

User.last.docs.create(title: 'Artisan', content: "In poke literally typewriter kombucha ugh, succulents flexitarian pour-over kickstarter pug. Cornhole tattooed pop-up church-key gochujang. Vape ramps green juice shoreditch, selvage anim schlitz lo-fi pop-up keffiyeh craft beer. Vero VHS edison bulb chia etsy, cronut leggings offal sapiente banh mi anim. Hexagon ex skateboard, pork belly keytar labore four loko keffiyeh thundercats magna quinoa nostrud. Microdosing labore four loko prism trust fund, laborum tempor adipisicing swag kogi exercitation fashion axe dreamcatcher cray migas. Artisan exercitation meditation gochujang affogato voluptate.")

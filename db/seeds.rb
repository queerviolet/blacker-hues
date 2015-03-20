[
  {title: 'Elixers', description: 'Healthful potions'},
  {title: 'Fauna', description: 'Living creatures'},
  {title: 'Ingredients', description: '(Formerly fauna)'},
  {title: 'Curios', description: 'Items which you are very unlikely to find elsewhere.'},
].each { |category| Category.create!(category) }

[
  {
    title: '2C-B',
    category: Category.find_by!(title: 'Elixers'),
    description: <<-EOF.strip_heredoc
      Pigments in the room became intensified. Shapes became rounder, more organic.
      A sensation of lightness and rivulets of warmth began seeping through my body.
      Bright lights began pulsing and flashing behind my closed lids. I began to
      perceive waves of energy flowing through all of us in unison. I saw all of
      us as a gridwork of electrical energy beings, nodes on a bright, pulsating
      network of light. Then the interior landscape shifted into broader scenes.
      Daliesque vistas were patterned with eyes of Horus, brocades of geometric
      design began shifting and changing through radiant patterns of light. It
      was an artist's paradise--representing virtually the full pantheon of the
      history of art.

      $2 / mg.
    EOF
  },
  {
    title: 'DOM',
    category: Category.find_by!(title: 'Elixers'),
    description: <<-EOF.strip_heredoc
      While I never felt threatened, I felt I knew what it was like to look across
      the brink to insanity.

      $1 / mg
    EOF
  },
  {
    title: 'Soul in a jar',
    category: Category.find_by!(title: 'Curios'),
    description: 'Probably human. $11'
  },
  {
    title: "I'm not even sure what this is",
    category: Category.find_by!(title: 'Curios'),
    description: "Occasionally moans. Look, it's very disturbing. Please take it away. Free."
  },
  {
    title: 'Free Goat',
    category: Category.find_by(title: 'Fauna'),
    description: <<-EOF.strip_heredoc
      Hey, I got a goat a while back, I was trying to have more of an erotic pet but
      its not going so well, and I need to give it away to a good home as soon as
      possible. Message if you have any interest at all. Thank you.    
    EOF
  },
  {
    title: 'Free Giant Cardboard Dinosaur',
    category: Category.find_by(title: 'Curios'),
    description: <<-EOF.strip_heredoc
      I made a giant dinosaur costume out of cardboard for halloween.
      My apartment is tiny.
      It is past halloween.
      The dinosaur refuses to get a job to help out with rent.
      
      In short, the dino must go. But I'm a sentimental sort of person so instead of
      chunking it in the recycling bin I'm trying to re-home it. For the low low
      price of $0 it can be yours!
      
      Pick up only, please. Email for the deets.
    EOF
  },
].each { |thing| Thing.create!(thing) }

require_relative 'phikal'

PHIKAL.each { |potion| Thing.create!(potion) }
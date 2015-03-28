# Users
[
  {
    nick: 'Desdemona',
    name: 'Desdemona Cruel Heart',
    email: 'blackest.rose@gmail.com',
    password: 'zzz',
  },
  {
    nick: 'Charity',
    name: 'Charity Blood VonBlackwell',
    email: 'not.your.savior@deadjournal.com',
    password: 'zzz',
  },
  {
    nick: 'GotherThanYou42',
    name: 'Fuck Off',
    email: 'gty4242@hotmail.com',
    password: 'zzz',
  },
  {
    nick: 'Raven',
    name: 'Raven NightWish',
    email: 'thieving.magpie@gmail.com',
    password: 'zzz',
  }
].each { |u| User.create!(u) }

# Posts
# Taken from the "i'm so goth" list
#    by lotus rose
# http://loteyrose.com/IAMSOGOTH.htm

# create_posts processes the seed data I copied out of that web page.
def create_posts(str)
  reply_regex = /^goth #\d: /  
  # The text is made of blocks separated by three newlines.
  str.split("\n\n\n").each do |conversation|
    conversation.strip!
    next unless conversation != ""
    # Most blocks have just one line, but some have a little conversation.
    thread = conversation.split("\n")
    parent = nil
    thread.each do |reply|
      # remove "goth #1:" and such from the beginning of the line
      reply.sub!(reply_regex, '')
      # When we have a conversation, we'll thread the replies, so our seed
      # data has some threads
      parent = Post.create!(content: reply, user: User.all.sample, parent: parent)
    end
  end
end

so_goth = <<-EOF
I'm so goth, in preschool, the only crayon I used was black. 


I'm so goth I dyed my belly button black.


goth #1: I'm so goth my eyes only see black and white.
goth #2: I'm so goth that if I opened my eyes the colours would kill me.
goth #3: I'm so goth I blinded myself so I could always see black.


I'm so goth my black is blacker than your black. I call it "black black." 


I'm so goth, I don't say "black," I say "blahhwwwkkk." 


I'm so goth, whenever I walk into a room, all the lights go out. 


goth #1: I'm so goth the people in the grocery store have refused to sell me any cereal other than Count Chocula.
goth #2: I'm so goth people ask me to AUTOGRAPH boxes of Count Chocula. 


I'm so goth people touch me and they BECOME goth. They say, "Oh no, now I'm goth!" 


I'm so goth I wear sunglasses when I open the refrigerator. 


I'm so goth I don't paint my nails black--I bash them with a hammer. 


I'm so goth I died and didn't notice. 


I'm so goth, whenever I knock on somebody's door they give me candy. 


I'm so goth, I'm not only "goth," but also "gothe" "goff" "gawth" "gauwth" "gothic" "gothik" "gothique" and "gawfickk" and soon I hope to be "gauewthickueu." 


I'm so goth, when I stop pouting, people ask, "What are YOU so happy about?" 


I'm so goth, when I go outside, the sun sets. 


goth #1: I'm so goth the smile muscles in my face have atrophied.
goth #2: I'm so goth the smile muscles in my face never GREW.
goth #3: What's a smile? 


I'm so goth I was born wearing eyeliner. 


I'm so goth I say things like "eternally yours in darkness" and "love and darkness" and "may the eternal darkness of the abyss enrapture and enshroud you in its infernal sickly sweet embrace." 


I'm so goth I don't use fabric softener, because I like pain. 


I'm so goth I set off airport metal detectors from ten feet away with all my jewelry.


I'm so goth I'm the only REAL goth. 


I'm so goth I smoke cloves in the shower. 


goth #1: I'm so goth a little rain cloud follows me wherever I go and rains on me.
goth #2: I'm so goth I AM the rain cloud. 


I'm so goth I'm more goth than anyone else. 


goth #1: I'm so goth I got a tattoo of celtic knotwork starting at the top of my head, winding all the way down my body, and trailing five feet behind me on the floor.
goth #2: I'm so goth I AM a tattoo.
goth #3: I'm so goth I pierced all my tattoos. 


I'm so goth it takes me an hour and a half to get dressed. 


I'm so goth it takes me longer to get UNdressed. 


I'm so goth I'm dead. 


I'm so goth I think electrical tape is a fashion accessory. 


I'm so goth, in preschool, all my drawings were titled, "DEATH." 


I'm so goth, in high school, all my papers were titled, "DEATH." 


I'm so goth I slather on spf 45 before I open the refrigerator. 


I'm so goth I wore corsets in preschool. 


goth #1: I'm so goth I wonder if my dog's collar would look better on me.
goth #2: I'm so goth I KNOW my dog's collar looks better on me.
goth #3: I'm so goth I stole my dog's collar. 


I'm so goth, when I was born, I asked for a light for my clove. 


I'm so goth I ate a Happy Meal . . . because I like to live dangerous. 


I'm so goth little kids are mesmerized by my appearance. 


I'm so goth parents leg their kids when they see them mesmerized by my appearance. 


I'm so goth I've been banned. 


I'm so goth nobody understands me, especially when I say, "the boom boom like shockalocka!!! . . . flibbaflobba!!!" 


I'm so goth I don't take my medications, so I can be more goth. 


I'm so goth, when I was born the doctor slapped me and I didn't cry. 


I'm so goth I make flowers wilt. 


I'm so goth I like them better that way. 


I'm so goth I punched a care bear. 


I'm so goth I think saying "oh my goth" is cute. 


I'm so goth, when I smile people ask me what's wrong. 


I'm so goth little old ladies in walkers cross the street to insult me. 


I'm so goth I keep getting hit on by necrophiliacs! 


I'm so goth I rooted for Gargamel. 


I'm so goth I practice my blank stare in the mirror. 


I'm so goth that when I moved into Mr. Roger's neighborhood, he moved away! 


I'm so goth I have carpal tunnel syndrome from constantly putting the back of my hand to my forehead. 


I'm so goth that whenever I walk into a room, you hear "Toccata and fugue in D minor." 


I'm so goth I listen to The Sisters of Mercy and Bauhaus simultaneously at midnight in a graveyard sitting in a pentagram surrounded by candles . . . and oh, there's a full moon . . . and then I die. And then I come back to life. And then I die again . . . tragically. 


I'm so goth I have actually seriously uttered the phrase, "the darkest dark of the dark darkness." 


I'm so goth I tried to use Cheer . . . it cried. 


goth #1: I'm so goth, when I'm sleeping people come and check my pulse.
goth #2: I'm so goth I don't have a pulse. 


I'm so goth I know what pvc stands for. 


I'm so goth the people at the suicide hotline have asked me to stop calling. 


I'm so goth I'm catholic. 


I'm so goth nuns and priests resent me because I look cooler in black than them.


I'm so goth tan lines are a sin. 


I'm so goth I was adopted by the Addams family. 


I'm so goth people keep asking me if I feel okay. 


I'm so goth the dark is scared of ME. 


I'm so goth I know how to spell Siouxsie & The Banshees correctly. 


I'm so goth I . . . wear . . . my . . . sunnnnnglasses at night (sung with a Corey Hart pout). 


I'm so goth I became a fisherman, just so I could use fishnets. 


I'm so goth I want to die die die my hair black. 


I'm so goth I'm on the second stage of aloof . . . I'm "bloof." 


I'm so goth I sleep UNDER my bed. 


I'm so goth, Robert Smith asked ME for my autograph. 


I'm so goth I got a 12-pack of absinthe. 


I'm so goth I don't eat gummy bears, I eat "glummy bears." 


I'm so goth I spend every waking moment, every breath, in contemplation of Goth. The totality of my being is at one with the essence of Goth. 


I'm so goth I dot my i's with frowny faces. 


I'm so goth I call a smile a "concave frown." 


I'm so goth that when I was a toddler, I didn't cry over spilled milk, I MOURNED it. 


I'm so goth my skin would catch on fire if it were ever exposed to sunlight. 


I'm so goth I make Happy Meals cry. 


I'm so goth I spend hours deciding what shade of black to wear. 


My grandmother is so goth she uses gothballs. 


I'm so goth I shower with bleach instead of soap. 


I'm so goth I have a fishnet umbrella. 


I'm so goth I always complain because my blacks don't match. 


I'm so goth that bats hang little plastic me's from their ceiling. 


I'm so goth that if I go out in the sunlight with bare skin showing, people have to put on shades because of the reflection off my pale skin. 


I'm so goth I have to wear sunglasses and sunscreen to look on the bright side. 


I'm so goth that lightning strikes whenever I count things. MUH-HA-HA-HA! 


I'm so goth that in kindergarten I sang "woe, woe, woe your boat..." 


I'm so goth I have crushed velvet lawn chairs. 


I'm so goth I'm a flying buttress. 


I'm so goth that colors fade away when I am nearby. 


I'm so goth I only eat things that are burnt, because they're black. 


I'm so goth, when I was little, I thought funeral processions were parades. 


I'm so goth I make rainbows frown. 


I'm so goth my clothes are made of dark matter.


I'm so goth I tried to be a hippie once and hugged a tree--and it died. 


I'm so goth, when our teacher told us to write the declaration of independence, I wrote the declaration of sindependence.


I'm so goth I sleep with my hands crossed on my chest.


I'm so goth, crucifixes shudder when I walk by.


I'm so goth I don't laugh...I cackle.


I'm so goth, I don't buy black clothes; I put them on and they TURN black.


I'm so goth I eat Unlucky Charms.


I'm so goth that a new shade of white had to be created to describe my skin color.


I'm so goth I make people cry when they look at me.


I'm so goth one of my pick-up lines is: "I'd love to see what your insides look like."


goth #1: I'm so goth I only drink black coffee.
goth #2: I'm so goth I don't drink coffee, I drink goffee.


I'm so goth my dog barks, "Bauhaus Bauhaus."


I'm so goth my wrists slit themselves.


I'm so goth my car wears a fishnet bra.


I'm so goth when I go to sleep I wake up with a toe tag.


I'm so goth, when I smile people ask me, "What are you plotting?"


I'm so goth I scare myself.


I'm so goth I was born wearing eyeliner.


I'm so goth I have a death certificate.


I'm so goth, I was goth when Bela Lugosi was still alive.


I'm so goth, when someone sneezes I say, "Goth bless you!"


I'm so goth I bleed black nail polish.


I'm so goth that I scare my hair into different colors.


goth #1: I'm so goth I like nightmares.
goth #2: I'm so goth nightmares have ME.


I'm so goth, when I go to school, they ask if it's hard to dig through six feet of dirt every morning.


I'm so goth my dead cat smokes cloves.


I'm so goth that I'm only wearing black until they invent a darker colour.



goth #1: I'm so goth I changed my name to Mystryss Darque Wintyr Nyght Rayn Ravyn.
goth #2: I'm so goth I don't have a name. I'm just "goth." 


I'm so goth all I do is sit around and talk about how goth I am. 


I'm so goth I always use the word "goth" instead of "got." 


I'm so goth every sentence I say has the word "goth" in it. 


I'm so goth I'm the only person who understands what goth REALLY is, and I'm not telling you!
EOF

create_posts(so_goth)
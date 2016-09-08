# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Monster.delete_all
bird = {
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-shoot.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-game-over.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-faint.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-dizzy.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-invincible.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-flying.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-flying-front.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/morning-park.png'
}

cat = {
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-twinkle.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-jet.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-flying.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-yelling.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-game-over.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-faint.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-explode.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-dizzy.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/high-mountain.png'
}

chicken = {
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-flying.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-invincible.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-attack.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-faint.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-game-over.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-surprised.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/cookie-mountain.png'
}

dragon = {
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-flying.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-invincible.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-jet.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-twinkle.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-dizzy.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-explode.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-faint.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-game-over.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-surprised.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/sakura-bg.png'
}

[dragon, cat, chicken, bird].each{|args| Monster.create!(args)}

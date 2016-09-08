# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Monster.delete_all
bird = {
name: 'bird',
positive_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-flying.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-flying-front.gif'],
negative_reactions:
['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-shoot.gif',  'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Bird/bird-dizzy.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/morning-park.png'
}

cat = {
name: 'cat',
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-flying.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-yelling.gif',  'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-faint.gif',  'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Cat/cat-dizzy.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/high-mountain.png'
}

chicken = {
name: 'chicken',
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-flying.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-attack.gif',   'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Chicken/chicken-surprised.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/cookie-mountain.png'
}

dragon = {
name: 'dragon',
positive_reactions:  ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-flying.gif', 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-invincible.gif'],
negative_reactions: ['https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-dizzy.gif',  'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-faint.gif',  'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/Dragon/dragon-surprised.gif'],
background: 'https://s3-us-west-2.amazonaws.com/mailmonsters/mail-monsters-zip/backgrounds/sakura-bg.png'
}

[dragon, cat, chicken, bird].each{|args| Monster.create!(args)}

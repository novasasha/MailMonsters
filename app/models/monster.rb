class Monster < ApplicationRecord

  has_many :user

  serialize :positive_reactions,Array
  serialize :negative_reactions,Array

  
end

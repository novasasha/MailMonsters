class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.text :positive_reactions
      t.text :negative_reactions
      t.text :background
      
      t.timestamps
    end
  end
end

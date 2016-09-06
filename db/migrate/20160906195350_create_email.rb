class CreateEmail < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :subject
      t.string :body
      t.string :labels
      t.datetime :date_received

      t.timestamps
    end
  end
end

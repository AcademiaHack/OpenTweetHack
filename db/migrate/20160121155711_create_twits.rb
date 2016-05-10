class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :twit
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

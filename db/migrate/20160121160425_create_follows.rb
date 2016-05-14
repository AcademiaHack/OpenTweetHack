class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :target_user, index: true
      t.references :source_user, index: true
      t.timestamps null: false
    end

    # add_reference :follows, :target_user
    # add_reference :follows, :source_user
    add_foreign_key :follows, :users, column: :target_user_id
    add_foreign_key :follows, :users, column: :source_user_id
  end
end

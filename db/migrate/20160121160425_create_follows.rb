class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      #t.references :user_target, index: {name: :target}, foreign_key: true
      #t.references :user_source, index: {name: :source}, foreign_key: true
      t.timestamps null: false
    end
    add_reference :follows, :user_target
    add_reference :follows, :user_source
    add_foreign_key :follows, :users, column: :user_target_id#, name: :user_target_id_fk
    add_foreign_key :follows, :users, column: :user_source_id#, name: :user_source_id_fk
  end
end

class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_index :thoughts, [:user_id, :created_at]
  end
end

class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.integer :category_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end

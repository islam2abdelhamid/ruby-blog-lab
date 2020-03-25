class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, limit:50, unique: true, null: false
      t.string :content, null: false
      t.references :user, foreign_key: true 

      t.timestamps
    end
  end
end

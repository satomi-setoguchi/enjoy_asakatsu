class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :record, foreign_key: true
      t.text :body
      t.string :image
      t.timestamps
    end
  end
end

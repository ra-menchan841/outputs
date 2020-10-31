class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, type: :integer, null: false, forign_key: true
      t.timestamps
    end
  end
end

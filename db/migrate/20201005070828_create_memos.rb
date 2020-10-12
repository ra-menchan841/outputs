class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.integer :user_id, null: false
      t.text :content
      t.timestamps
    end
  end
end

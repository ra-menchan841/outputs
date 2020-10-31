class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.text :content
      t.references :user, type: :integer, null: false, forign_key: true
      t.timestamps
    end
  end
end

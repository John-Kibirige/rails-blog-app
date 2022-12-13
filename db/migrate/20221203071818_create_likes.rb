class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps

    add_index :likes, [:author_id, :post_id], unique: true
  end
end

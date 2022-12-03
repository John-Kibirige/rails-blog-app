class AddPostToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, index: true, foreign_key: true
  end
end
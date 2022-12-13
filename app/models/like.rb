class Like < ApplicationRecord

  validates :author_id, uniqueness: {scope: :post_id}

  after_save :update_likes_count
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_likes_count
    post.increment!(:likes_counter)
  end
end

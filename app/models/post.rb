class Post < ActiveRecord::Base
  attr_accessible :content, :url
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates :url, presence: true
  
  default_scope order: 'posts.created_at DESC'
end

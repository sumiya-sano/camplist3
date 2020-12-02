class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable
  
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  acts_as_followable
  acts_as_follower

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end


  
  
end

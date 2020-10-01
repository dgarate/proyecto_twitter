class User < ApplicationRecord
  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :friends, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :friends, source: :followed

  has_many :reverse_friends, foreign_key: "followed_id",  class_name:  "Friend", dependent:   :destroy
  has_many :followers, through: :reverse_friends, source: :follower


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def to_s
      email 
    end

    def following?(other_user)
      friends.find_by(followed_id: other_user.id)
    end

    def follow!(other_user)
        friends.create!(followed_id: other_user.id)
    end
    
    def unfollow!(other_user)
      friends.find_by(followed_id: other_user.id).destroy
    end



           
end

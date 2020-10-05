class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tweet, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  scope :tweets_for_me, -> {where(tweets.user_id = current_user.friends.followed_id)}



  after_create do
    tweet = Tweet.find_by(id: self.id)
    hashtags = self.tweet.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tweet.tags << tag
    end

  end

end

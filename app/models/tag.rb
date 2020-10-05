class Tag < ApplicationRecord
    # has_and_belongs_to_many :tweets
    has_many :taggings, dependent: :destroy
    has_many :tweets, through: :taggings
end

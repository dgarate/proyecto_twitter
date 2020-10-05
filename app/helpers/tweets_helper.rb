module TweetsHelper
    def render_with_hashtags(tweet)
        tweet.gsub(/#\w+/){|word| link_to word, "/tweets/hashtag/#{word.downcase.delete('#')}"}.html_safe
    end 

end

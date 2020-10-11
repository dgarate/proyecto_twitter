

# json.partial! "shared/pagination", collection: @tweets

    # json.pagination paginate(@collection)
    # do
    # json.current_page @tweets.current_page
    # json.per_page @tweets.per_page
    # json.total_entries @tweets.total_entries
    # end
  
    json.tweets @tweets, partial: 'api/tweets/tweet', as: :tweet
  
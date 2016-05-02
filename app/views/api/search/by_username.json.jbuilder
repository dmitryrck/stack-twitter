json.array! @account.tweets do |tweet|
  json.id rand(1000)
  json.text formatted_tweet_text(tweet.text)
  json.createdAt tweet.created_at
end

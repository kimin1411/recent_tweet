class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    $client.user_timeline(self.username, count: 10).each do |x|
     self.tweets.create(text: x.text)
    end
  end

  def tweets_stale?
    return self.tweets.last.created_at < (Time.now - 900)
  end


end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
 @user = User.find_by_username(params[:username])
 if @user.tweets.empty? or @user.tweets_stale?
  @user.fetch_tweets!
  erb :processing
  else
 @tweets = @user.tweets.limit(10)
 erb :tweets
  end
end
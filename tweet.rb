###
# Fork this gist.  Copy the code into a new file named `tweet.rb` in your
# `projects` directory.
#
# From the virtual machine, you can run it by typing
#     ruby tweet.rb
 
 
 
 
 
### This just makes the tests run.  Nothing for you to do here.
require 'minitest'
require 'minitest/reporters'
MiniTest.autorun
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
 
 
 
 
###
# Here is the test suite.  It shows you what result we expect from each method
# call.
#
# Each test is being skipped right now. Comment out or delete the skip when you
# are ready to work on a test.  Get as many tests to pass as possible.
#
# Read through each test to figure out what it is looking for.
class TwitterTest < MiniTest::Test
  def test_user_should_require_a_name
    #skip
    user = Twitter::User.new('')
    assert_equal false, user.valid?
  end
 
  def test_user_is_valid_with_a_name
    #skip
    user = Twitter::User.new('newname')
    assert_equal true, user.valid?
  end
 
  def test_tweet_creating_a_valid_tweet
    #skip
    user = Twitter::User.new('newname')
    tweet = Twitter::Tweet.new(user, 'tweet text')
    assert_equal true, tweet.valid?
  end
 
  def test_tweet_requires_a_user_class_instance
    #skip
    user = ''
    tweet = Twitter::Tweet.new(user, 'tweet text')
    assert_equal false, tweet.valid?
  end
 
  def test_tweet_can_not_be_blank
    #skip
    user = Twitter::User.new('newname')
    tweet = Twitter::Tweet.new(user, '')
    assert_equal false, tweet.valid?
  end
 
  def test_tweet_can_not_be_too_long
    #skip
    user = Twitter::User.new('newname')
    tweet = Twitter::Tweet.new(user, 'a' * 141)
    assert_equal false, tweet.valid?
  end
 
  def test_invalid_tweet_adds_an_error
    #skip
    client = Twitter::Client.new
    tweet = client.tweet('newuser', '') # too short
    assert_equal false, tweet.valid?
    #assert_equal 1, client.errors.length
  end
 
  def test_tweet_method_returns_the_tweet
    #skip
    client = Twitter::Client.new
    tweet = client.tweet('newuser', 'text')
    assert tweet.is_a?(Twitter::Tweet)
  end
 
  def test_tweeting
    #skip
    client = Twitter::Client.new
    client.tweet('newuser', 'text')
    assert_equal 1, client.tweets.count, 'Client#tweets should have one tweet'
    assert_equal 1, client.users.count, 'Client#users should have one user'
 
    # tweeting again with the same user
    client.tweet('newuser', 'another bit of text')
    assert_equal 2, client.tweets.count, 'Client#tweets should have two tweets now'
    assert_equal 1, client.users.count, 'Client#users should still have one user'
  end
 
  def test_looking_up_tweets_by_username
    #skip
    client = Twitter::Client.new
    client.tweet('user1', 'tweet 1')
    client.tweet('user1', 'tweet 2')
    client.tweet('user1', 'tweet 3')
    client.tweet('user2', 'tweet 4')
 
    assert_equal 3, client.tweets_by_username('user1').count, 'user1 should have three tweets'
    assert_equal 1, client.tweets_by_username('user2').count, 'user2 should have one tweet'
  end
end
 
###
# Here is a starting structure for your code.
#
# All the methods you should need are here.  Fill in the blanks!
 
 
 
module Twitter
  class Client
    # these will be arrays
    attr_reader :tweets, :users, :errors
 
    # You shouldn't need to add anything else to this method.
    def initialize
      reset
    end
 
    # This method creates a new Tweet object. If it is valid, it adds it to the
    # internal `tweets` array. If it is not, it adds an error message to the
    # internal `errors` array. In both cases it still returns the Tweet object.
    #
    # Note: before creating the Tweet, you'll need to lookup the User.  If the
    # User already exists then use that User object. If not, create a new user.
    # That's what the `find_or_create_user` method below is for.
    def tweet(username, text)
      user = find_or_create_user(username)
      tweet = Twitter::Tweet.new(user, text)

      if user and tweet
        tweets.push(tweet)
      else
        errors.push(tweet)
      end

      tweet
    end
 
    # Return an array of all Tweets by the appropriate user.
    def tweets_by_username(username = nil) 
      user_array_tweet = Array.new

      users.each do |search|
        if search.username == username
          tweets.each do |t|
            if t.user.username == username 
              user_array_tweet.push(t)
            end
          end
        end
      end

      return user_array_tweet
    end
 
    private
 
    # Returns a Twitter::User object.
    def find_or_create_user(username)
      user =  Twitter::User.new(username)

      add = true

      users.each do |search|
        if search.username == username
          add = false
        end
      end

      if add
        users.push(user)
      end

      return user
    end
 
 
    # This method is called by the initializer.  Use it to create your three
    # instance variables here.
    def reset
      @tweets = Array.new
      @errors = Array.new
      @users = Array.new
    end
  end
 
  class Tweet
    attr_reader :user, :text
 
    # This initializer takes two parameters:
    #   `user` must be a Twitter::User object (so an instance of that class)
    #   `text` is a string of words between 1 and 140 characters
    def initialize(user, text)
      @user = user
      @text = text
    end
 
    # This method checks that the `user` is a Twitter::User object and that
    # `text` is a string within the minimum and maximum lengths.
    def valid?
      @user.instance_of? Twitter::User and @user.valid? and @text.length >=  1 and @text.length <= 140
    end
  end
 
  class User
    attr_accessor :username, :location
 
    # This initializer takes one parameters:
    #   `username` is a string
    def initialize(username)
      @username = username
    end
 
    # This method checks to ensure that `username` isn't blank
    # It's possible to just add a single line of code in here.
    def valid?
      !@username.empty?
    end
 
    # This method creates and returns a new Twitter::Tweet instance.
    # The Tweet instance that's returned must its user set to the current user
    # and the text set to whatever is passed in.
    #
    # Hint: you'll need to use the `self` keyword.
    def new_tweet(text)
    end
  end
end
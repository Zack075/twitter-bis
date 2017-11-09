require "twitter"
#!/usr/bin/env ruby

class SendTweet
	def initialize(string)
		@string = string
	
		
	end

	def log_in_to_twitter
		@client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = Figaro.env.YOUR_CONSUMER_KEY
  	config.consumer_secret     = Figaro.env.YOUR_CONSUMER_SECRET
  	config.access_token        = Figaro.env.YOUR_ACCESS_TOKEN
  	config.access_token_secret = Figaro.env.YOUR_ACCESS_SECRET
		end
	end

	def send_tweet	
		@client.update(@string)
	end

	def perform
		log_in_to_twitter
		send_tweet
		
	end
end

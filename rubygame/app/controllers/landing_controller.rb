require "ruby_gg"
class LandingController < ApplicationController
  client = RubyGg::Client.new(api_key, 'na') #I'll PM you guys the api_key, don't push it to github. 
  challengerId = client.challenger.solo_challengers
  @summonerInfos = []
  challengerId.each {|x|@summonerInfos.push(client.summoner.get_profile(x))}
  puts @summonerInfos
  def index
  end
end

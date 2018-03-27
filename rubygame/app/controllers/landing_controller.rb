require "ruby_gg"
class LandingController < ApplicationController
 
  def index
  client = RubyGg::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na') #I'll PM you guys the api_key, don't push it to github. 
  challenger = client.challenger.solo_queue(1)
  @challengerinfo = []
  challenger.each {|x| @challengerinfo.push(client.summoner.get_profile(x[:playerOrTeamId]))}

  end
  
end

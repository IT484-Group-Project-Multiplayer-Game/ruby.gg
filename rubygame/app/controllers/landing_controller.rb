require "ruby_gg"
class LandingController < ApplicationController
 
  def index
    @client = RubyGg::Client.new(env['league_api_key'], 'na') #I'll PM you guys the api_key, don't push it to github. 
    # challenger = @client.challenger.solo_queue(6)
    @challengerinfo = []
    # challenger.each {|x| @challengerinfo.push(@client.summoner.find(x[:playerOrTeamName]))}
    @challengerinfo.push(@client.summoner.find('rockerturner'))
    # @challengerinfo.push(@client.summoner.find('yb50110'))
    @challengerinfo.push(@client.summoner.find('Knuckleś'))
    @challengerinfo.push(@client.summoner.find('catdg'))
    @challengerinfo.push(@client.summoner.find('zedberg'))
    @challengerinfo.push(@client.summoner.find('owlfile'))
  end
  
  def search
    
  end
  
  
end

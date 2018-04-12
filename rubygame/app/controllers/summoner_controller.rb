require "ruby_gg"
class SummonerController < ApplicationController
 
  def index
    @client = RubyGg::Client.new(ENV['league_api_key'], 'na') #I'll PM you guys the api_key, don't push it to github. 
    challenger = @client.challenger.solo_queue(6)
    @challengerinfo = []
    challenger.each {|x| @challengerinfo.push(@client.summoner.find(x[:playerOrTeamName]))}
    # @challengerinfo.push(@client.summoner.find('rockerturner'))
    # # @challengerinfo.push(@client.summoner.find('yb50110'))
    # @challengerinfo.push(@client.summoner.find('Knuckleś'))
    # @challengerinfo.push(@client.summoner.find('catdg'))
    # @challengerinfo.push(@client.summoner.find('zedberg'))
    # @challengerinfo.push(@client.summoner.find('owlfile'))
  end

  def search
     @searchedSummoner = params[:search]
     if @searchedSummoner != ''
        redirect_to summoner_show_path(@searchedSummoner)
     else
        redirect_to summoner_index_path
     end
     # flash[:notice] = @searchedSummoner
  end

  def show

  end

end

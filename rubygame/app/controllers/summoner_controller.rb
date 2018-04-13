require "ruby_gg"
class SummonerController < ApplicationController
 
  def index
    @client = @@client #I'll PM you guys the api_key, don't push it to github. 
    challenger = @client.challenger.solo_queue(5)
    @challengerinfo = []
    challenger.each {|x| @challengerinfo.push(@client.summoner.find(x[:playerOrTeamName]))}
    
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
    @client = @@client
    @summonerIGN = params[:ign]
  end

end

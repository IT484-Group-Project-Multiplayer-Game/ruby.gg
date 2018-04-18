require "ruby_gg"
class SummonerController < ApplicationController
 
  def index
    @client = RubyGg::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na') #I'll PM you guys the api_key, don't push it to github. 
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
     if params[:search]
        # Searched from header
        @searchedSummoner = params[:search]
     else
        # Searched from landing page
        @searchedSummoner = params[:searchFrHome]
     end

     if @searchedSummoner != ''
        redirect_to summoner_show_path(@searchedSummoner)
     else
        redirect_to root_path
     end

     # flash[:notice] = @searchedSummoner
  end

  def show

  end

end

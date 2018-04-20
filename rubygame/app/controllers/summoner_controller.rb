require "ruby_gg"
class SummonerController < ApplicationController
 
  def index
    @client = RubyGg::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na') #I'll PM you guys the api_key, don't push it to github. 
    challenger = @client.challenger.solo_queue(5)
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
        flash[:notice] = "Please enter a summoner name"
        redirect_to summoner_index_path
     end
  end

  def show

  end

  def favoritesIndex
    @favoriteSummoner = Favorites.find_by uid: current_user.uid
  end

  def favoritesSave
    @summoner = params[:ign]

    if current_user.blank?
        flash[:notice] = "Please log in to add summoner into Favorites"
        redirect_to summoner_show_path(@summoner)
    else
        @uid = current_user.uid

        Favorites.create!(params[:uid, :summoner])

        flash[:notice] = "Successfully added summoner into Favorites"
        redirect_to redirect_to summoner_show_path(@summoner)
    end
  end

end
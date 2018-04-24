require "ruby_gg"
class SummonerController < ApplicationController
 
  def index
    @client = RubyGg::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na') #I'll PM you guys the api_key, don't push it to github. 
    challenger = @client.challenger.solo_queue(5)
    @challengerinfo = []
    challenger.each {|x| @challengerinfo.push(@client.summoner.find(x[:playerOrTeamName]))}
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
        flash[:notice] = "Please enter a summoner name"
        redirect_to root_path
     end
  end

  def show
      if !current_user.blank?
        favoriteCheck = Favorite.where(:user => current_user.id, :summoner => params[:ign]).pluck(:summoner)
        if favoriteCheck != []
            @favorite = true
        end
      end
  end

  def favoritesIndex
    @client = RubyGg::Client.new("RGAPI-89538f52-2141-443c-aaaa-9cb0d44ea380", 'na')
    favoriteSummoners = Favorite.where(:user => current_user.id).pluck(:summoner)
    @summonerInfo = []
    favoriteSummoners.each { |x|
        @summonerInfo.push(@client.summoner.find(x))
        }
  end

  def favoritesSave
    summoner = params[:ign]

    if current_user.blank?
        flash[:notice] = "Please log in to add summoner into Favorites"
        redirect_to summoner_show_path(@summoner)
    else
        user = current_user.id

        Favorite.create!(:user => user, :summoner => summoner)

        flash[:notice] = "Successfully added summoner #{summoner} into Favorites"
        redirect_to summoner_show_path(:ign => summoner)
    end
  end

  def favoritesDelete
     summoner = params[:ign]

     if current_user.blank?
        flash[:notice] = "Please log in to remove summoner from Favorites"
        redirect_to summoner_show_path(@summoner)
     else
        @unfavoriteSummoner = Favorite.where(:user => current_user.id, :summoner => summoner)
        @unfavoriteSummoner.destroy_all

        flash[:notice] = "Successfully removed summoner #{summoner} from Favorites"
        redirect_to summoner_show_path(:ign => summoner)
    end
  end

end
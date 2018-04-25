
class SummonerController < ApplicationController
 
  def index
    @client = @@client
    challenger = @client.challenger.solo_queue(5)
    @challengerinfo = []
    challenger.each {|x| @challengerinfo.push(@client.summoner.find(x[:playerOrTeamName]))}
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
      @client = @@client
      @summonerIGN = params[:ign]
      if !current_user.blank?
        favoriteCheck = Favorite.where(:user => current_user.id, :summoner => params[:ign]).pluck(:summoner)
        if favoriteCheck != []
            @favorite = true
        end
      end
  end

  def favoritesIndex
    @client = @@client
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
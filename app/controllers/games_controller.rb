class GamesController < ApplicationController
    def index
        s = Sport.find_by(id: params[:sport_id])
        Game.scraper(s.key, s.id)
        games = s.games
        render json: GameSerializer.new(games)
    end

    def show 
        g = Game.find(params[:id])
        render json: GameSerializer.new(g)
    end

end

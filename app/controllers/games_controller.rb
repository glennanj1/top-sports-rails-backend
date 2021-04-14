class GamesController < ApplicationController
    def index
        s = Sport.find_by(params[:id])
        Game.scraper(s.key, s.id)
        games = Game.where("sport_id = ?", params[:sport_id])
        render json: GameSerializer.new(games)
    end

end

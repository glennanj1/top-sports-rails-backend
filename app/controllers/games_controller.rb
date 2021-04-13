class GamesController < ApplicationController
    def index
        game = Game.all 
        render json: GameSerializer.new(games)
    end
end

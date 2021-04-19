class BetsController < ApplicationController
    def index 
        bets = Bet.all
        render json: BetSerializer.new(bets)
    end

    def create
        bet = Bet.new(bet_params)
        if bet.save 
            render json: BetSerializer.new(bet)
        else
            render json: {error: "Bet not placed"}
        end
    end

    private 

    def bet_params 
        params.require(:bet).permit(:amount, :date, :odds, :game_id, :team)
    end
end

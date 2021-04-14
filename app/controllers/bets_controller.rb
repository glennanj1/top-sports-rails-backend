class BetsController < ApplicationController
    def index 
        binding.pry
    end

    def create
        bet = Bet.new(bet_params)
        binding.pry
        #bet.game = Game ??
        if bet.save 
            render json: BetSerializer.new(bet)
        else
            render json: {error: "Bet not placed"}
        end
    end

    private 

    def bet_params 
        params.require(:bet).permit(:amount, :date, :odds)
    end
end

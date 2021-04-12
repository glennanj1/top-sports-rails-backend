class ConferencesController < ApplicationController
    def index
        conferences = Conference.all 
        render json: ConferenceSerializer.new(conferences)
    end
end

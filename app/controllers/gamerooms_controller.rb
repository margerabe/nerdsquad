class GameroomsController < ApplicationController
    def new
        @gameroom = Gameroom.new
    end
    
    def create
        @gameroom = Gameroom.new(gameroom_params)
    end

    def show
        @gameroom = Gameroom.find(params[:id])
        @message = Message.new
    end
    
    def update
        @gameroom = Gameroom.find(params[:id])
        @gameroom.update(gameroom_params)
        redirect_to gameroom_path(params[:id])
    end

    private

    def gameroom_params
      params.require(:gameroom).permit(:name)
    end
end

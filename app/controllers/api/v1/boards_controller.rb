class Api::V1::BoardsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_restaurant, only: [ :show, :update ]
  
    def update
      if @board.update(board_params)
        render :show
      else
        render_error
      end
    end
  
    private
  
    def board_params
      params.require(:board).permit(:posX, :posY)
    end
  
    def render_error
      render json: { errors: @board.errors.full_messages },
        status: :unprocessable_entity
    end
  end
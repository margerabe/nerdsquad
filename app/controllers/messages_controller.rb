class MessagesController < ApplicationController
    def create
        @gameroom = Gameroom.find(params[:gameroom_id])
        @message = Message.new(message_params)
        @message.gameroom = @gameroom
        @message.user = current_user
        if @message.save
            GameroomChannel.broadcast_to(
            @gameroom,
            render_to_string(partial: "message", locals: { message: @message })
            )
          redirect_to gameroom_path(@gameroom, anchor: "message-#{@message.id}")
        else
          render "gamerooms/show"
        end
      end

      private

      def message_params
        params.require(:message).permit(:content)
      end
end

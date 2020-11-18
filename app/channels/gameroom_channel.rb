class GameroomChannel < ApplicationCable::Channel
  def subscribed
    gameroom = Gameroom.find(params[:id])
    stream_for gameroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

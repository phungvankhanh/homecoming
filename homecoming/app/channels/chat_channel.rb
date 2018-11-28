class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    if current_user
        @group = Group.find params[:group_id]
        stream_for @group
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    @sender = User.find(data['sender_id'])
    ChatChannel.broadcast_to(
      Group.find(data['group_id']),
      message: data['message'],
      sender: @sender
    )
  end
end

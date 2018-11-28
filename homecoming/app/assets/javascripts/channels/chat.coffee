$ ->
  if(group_body = $( "#group-body" )).length
    group_id = group_body.data('group-id')
    console.log(group_id)

    App.chat = App.cable.subscriptions.create {channel: "ChatChannel", group_id: group_id },
      connected: ->
      # Called when the subscription is ready for use on the server

      disconnected: ->
      # Called when the subscription has been terminated by the server

      received: (data) ->
      # Called when there's incoming data on the websocket for this channel
        console.log("New data: " + data.sender)
        now = $.now()
        content = """
          <div class="incoming_msg" id="message_#{now}">
            <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
            </div>
            <div class="received_msg">
              <p>#{data.sender.email}</p>
              <div class="received_withd_msg">
                <p id="vl">#{data.message}</p>
                <span class="time_date"> 11:01 AM | June 9</span>
              </div>
            </div>
          </div>
          <hr>
        """
        message_list_div = $('#message-list')
        message_list_div.append(content)
        message_list_div.scrollTop()
    
    $( "#send-message-to-group" ).on "click", ->
      input_box = $("#input-message-to-group")
      message = input_box.val();
      sender_id = input_box.data('sender-id')
      group_id = input_box.data('group-id')
      console.log (message)
      console.log(sender_id)
      console.log(group_id)
      console.log($('.msg_history').html())
      App.chat.send({ sender_id: sender_id, group_id: group_id, message: message })

    
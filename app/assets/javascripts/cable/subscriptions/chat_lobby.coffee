inquiry = $("#chat-feed").attr("data-chatroom")

App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: inquiry},
  received: (data) ->
    @appendLine(data)
    @scrollToBottom()
    # $('#chat-feed').stop().animate { scrollTop: $('#chat-feed')[0].scrollHeight }, 800

  appendLine: (data) ->
    html = @createLine(data)
    $(".chatbox-messages").append(html)

  createLine: (data) ->
    if data["sender_type"] is "gibber"
      """
      <div class="message-gibber">
        <div class="message-gibber-name">
          <span>  #{data["sender_first_name"]}</span>
        </div>
        <div class="message-gibber-content">
          <span>#{data["content"]}</span>
        </div>
      </div>
      """
    else
      """
      <div class="message-user">
        <div class="message-user-name">
          <span>#{data["sender_first_name"]}  </span>
        </div>
        <div class="message-user-content">
          <span>#{data["content"]}</span>
        </div>
      </div>
      """

    # """
    # <article class="chat-line">
    #   <span class="speaker">#{data["username"]} :</span>
    #   <span class="body">#{data["content"]}</span>
    # </article>
    # """

  scrollToBottom: ->
    height = $(".chatbox-messages")[0].scrollHeight
    $(".chatbox-messages").scrollTop(height)

$(document).on 'keypress', 'input.chat-input', (event) ->
  if event.keyCode is 13
    App.chatChannel.send
      content: event.target.value
      sender_id:    $('input.sender-id').val()
      sender_type:  $('input.sender-type').val()
      inquiry_id:  $('input.inquiry-id').val()
      room: inquiry
    event.target.value = ''

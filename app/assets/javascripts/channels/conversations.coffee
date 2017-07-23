jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if messages.length > 0
    App.conversations = App.cable.subscriptions.create {
        channel: "ConversationsChannel"
        conversation_id: messages.data("conversation-id")
      },
      connected: ->
        console.log("connected")

      disconnected: ->
        console.log("disconnected")

      received: (data) ->
        console.log("received")
        messages.find("dl").append(data["message"])
    
      send_message: (content, conversation_id) ->
        console.log("send_message")
        @perform "send_message", content: content, conversation_id: conversation_id

      $("#new_message").submit (e) ->
        $this = $(this)
        textarea = $this.find('#message_content')
        if $.trim(textarea.val()).length > 1
          App.conversations.send_message textarea.val(), messages.data('conversation-id')
          textarea.val('')
        e.preventDefault()
        return false
App.conversations = App.cable.subscriptions.create {
    channel: "ConversationsChannel"
    conversation_id: ''
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Data received

  send_message: (message, conversation_id) ->
    @perform 'send_message', message: message, conversation_id: conversation_id
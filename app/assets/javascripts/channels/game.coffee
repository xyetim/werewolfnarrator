$ ->
  player_id = $("#player_id").attr("player_id")

  if window.location.pathname == "/game"
    App.cable.subscriptions.create {
      channel: "GameChannel",
      player_name: player_id
      },
      connected: ->
        # Called when the subscription is ready for use on the server
        console.log("DEBUG: Actioncable connected with id: " + player_id)

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Called when there is incoming data on the websocket for this channel
        console.log("Got the message:" + data["message"])

      rejected: ->
        console.log("rejected")

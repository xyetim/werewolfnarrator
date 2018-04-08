$ ->
  player_id = $("#player_id").attr("player_id")

  if window.location.pathname == "/game"
    App.cable.subscriptions.create {
      channel: "GameChannel",
      player_id: player_id
      },
      rejected: ->
        console.warn("WEBSOCKET: rejected")

      disconnected: ->
        console.warn("WEBSOCKET: disconnected")
        # Called when the subscription has been terminated by the server

      connected: ->
        # Called when the subscription is ready for use on the server
        console.log("WEBSOCKET: connected with id: " + player_id)

      received: (data) ->
        # Called when there is incoming data on the websocket for this channel
        console.log("WEBSOCKET: got message:" + data["type"])

        # switch
        #   when data["type"] == "players-status" then test()
        #   else console.warn("Received unknown push message")


test = ->
  console.log("test")

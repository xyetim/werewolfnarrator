$(document).on "click", ".ready.button", ->
  player_id = $("#player_id").attr("player_id")
  App.gameChannel.send({player_id: player_id, response: "ready"})

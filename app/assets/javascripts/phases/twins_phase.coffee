$(document).on "click", ".twins_phase .ready.button", ->
  player_id = $("#player_id").attr("player_id")
  App.gameChannel.send({player_id: player_id, response: "ready"})
  $(".ready.button").hide()

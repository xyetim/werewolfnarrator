# Confirm Done
$(document).on "click", ".werewolves_phase .vote.button", ->
  player_id = $("#player_id").attr("player_id")

  App.gameChannel.send({player_id: player_id, response: "TODO CHOSEN PLAYER ID HERE"})
  $(".vote.button").hide()

target = this

# On picking a target
$(document).on "click", ".seer_phase .vote.button", (event) ->
  player_id = $("#player_id").attr("player_id")

  target.player_id = $(event.target).attr("player_id")

  $(".target_name").text($(event.target).text())

  $(".choose_stage").hide()
  $(".confirm_stage").show()

# on confirm
$(document).on "click", ".seer_phase .comfirm.button", (event) ->
  App.gameChannel.send({player_id: player_id, response: target.player_id})

  $(".button").hide()

# on cancel
$(document).on "click", ".seer_phase .cancel.button", (event) ->
  $(".choose_stage").show()
  $(".confirm_stage").hide()

# on confirm
$(document).on "click", ".seer_phase .done.button", (event) ->
  App.gameChannel.send({player_id: player_id, response: "ready"})

  $(".button").hide()

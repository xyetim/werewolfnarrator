target = this

# On picking a target
$(document).on "click", ".second_mayor_phase .vote.button", (event) ->
  target.tplayer_id = $(event.target).attr("player_id")

  $(".target_name").text($(event.target).text())

  $(".choose_stage").hide()
  $(".confirm_stage").show()

# on confirm
$(document).on "click", ".second_mayor_phase .comfirm.button", (event) ->
  App.gameChannel.send({response: target.tplayer_id})

  $(".button").hide()

# on cancel
$(document).on "click", ".second_mayor_phase .cancel.button", (event) ->
  $(".choose_stage").show()
  $(".confirm_stage").hide()

target = this

# On picking a target
$(document).on "click", ".lynch_phase .vote.button", (event) ->
  target.tplayer_id = $(event.target).attr("player_id")

  $(".target_name").text($(event.target).text())

  $(".choose_stage").hide()
  $(".confirm_stage").show()

# on confirm
$(document).on "click", ".lynch_phase .comfirm.button", (event) ->
  console.log(target.tplayer_id)
  App.gameChannel.send({response: target.tplayer_id})

  $(".button").hide()

# on cancel
$(document).on "click", ".lynch_phase .cancel.button", (event) ->
  $(".choose_stage").show()
  $(".confirm_stage").hide()

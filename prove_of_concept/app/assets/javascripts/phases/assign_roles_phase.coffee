# peak at role
$(document).on "mousedown", ".assign_roles_phase .show.button", ->
  $('.role').css('visibility','visible')
  #$('.ready.button').show()

$(document).on "touchstart", ".assign_roles_phase .show.button", ->
  $('.role').css('visibility','visible')
  #$('.ready.button').show()

$(document).on "mouseup", "body", ->
  $('.role').css('visibility','hidden')

$(document).on "touchend", "body", ->
  $('.role').css('visibility','hidden')

# Confirm Done
$(document).on "click", ".assign_roles_phase .ready.button", ->
  App.gameChannel.send({response: "ready"})
  $(".ready.button").hide()

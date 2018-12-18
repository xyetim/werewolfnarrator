# peak at role
$(document).on "mousedown", ".header", ->
  $('.role_peak').show()

$(document).on "touchstart", ".header", ->
  $('.role_peak').show()

$(document).on "mouseup", "body", ->
  $('.role_peak').hide()

$(document).on "touchend", "body", ->
  $('.role_peak').hide()


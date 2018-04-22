# peak at role
$(document).on "mousedown", ".header", ->
  $('.role_peak').css('visibility','visible')

$(document).on "touchstart", ".header", ->
  $('.role_peak').css('visibility','visible')

$(document).on "mouseup", "body", ->
  $('.role_peak').css('visibility','hidden')

$(document).on "touchend", "body", ->
  $('.role_peak').css('visibility','hidden')

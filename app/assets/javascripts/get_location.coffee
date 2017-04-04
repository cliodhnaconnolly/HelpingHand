# Successful geolocation
locateSuccess = (loc) ->
  $('#lat').val loc.coords.latitude
  $('#long').val loc.coords.longitude
  $.ajax(
    type: 'POST'
    url: '/store_location/'
    data:
      lat: loc.coords.latitude
      lng: loc.coords.longitude
    dataType: 'json').done (data) ->
  console.log data
  return
  return

# Unsuccessful geolocation
locateFail = (geoPositionError) ->
  switch geoPositionError.code
    when 0
# UNKNOWN_ERROR
      alert 'An unknown error occurred, sorry'
    when 1
# PERMISSION_DENIED
      alert 'Permission to use Geolocation was denied, please use a different browser'
    when 2
# POSITION_UNAVAILABLE
      alert 'Couldn\'t find you...'
    when 3
# TIMEOUT
      alert 'The Geolocation request took too long and timed out'
  return

$(document).ready ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition locateSuccess, locateFail
  else
    alert 'Your browser does not allow me to access your current location, sorry.'
  return

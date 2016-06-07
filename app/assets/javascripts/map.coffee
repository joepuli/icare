class @App.Map
  constructor: ->
    @addHeight()
    @buildMap()
    @generateMap()

  addHeight: ->
    height = $(window.top).height()
    $('#map').innerHeight(height * .8)

  generateMap: ->
    Gmaps.map.buildMap { provider: { maxZoom: 15 }, internal: { id: 'map' } }, =>
      center = @center()
      Gmaps.map.map.centerOn(center)
      Gmaps.map.addMarker(center)
      Gmaps.markers = Gmaps.map.addMarkers($('[data-hash]').data('hash'),
                                           animation: google.maps.Animation.DROP)
      Gmaps.map.bounds.extendWith(Gmaps.markers)

  center: ->
    user_location = $('[data-user-location]').data('user-location')
    lng: user_location[0]
    lat: user_location[1]
    infowindow: 'Home'
    picture:
      url: $('[data-home-icon]').data('home-icon')
      height: '64'
      width: '64'
      scaledWidth: '32'
      scaledHeight: '32'

  buildMap: ->
    Gmaps.map = Gmaps.build('Google')

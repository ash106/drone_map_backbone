class DroneMapBackbone.Views.StrikesIndex extends Backbone.View

  template: HandlebarsTemplates['strikes/index']

  initialize: ->
    @listenTo(@collection, 'reset', @render)
    @map_bounds = new google.maps.LatLngBounds(null)

  render: ->
    @$el.html(@template(strikes: @collection))
    if @collection.length
      @map = @gm_init()
      @collection.each @appendStrike, this
      @map.fitBounds @map_bounds
      @map.panToBounds @map_bounds
    this

  appendStrike: (strike) ->
    marker = new google.maps.Marker
      position: new google.maps.LatLng strike.get('lat'), strike.get('lon')
      map: @map
      draggable: false
    @map_bounds.extend marker.getPosition()
    view = new DroneMapBackbone.Views.Strike(model: strike, marker: marker)
    $('#strikes > tbody:last').append(view.render().el)
    
  gm_init: ->
    mapOptions =
      center: new google.maps.LatLng(-34.397, 150.644)
      zoom: 8
      mapTypeId: google.maps.MapTypeId.ROADMAP
    new google.maps.Map($("#map_canvas")[0], mapOptions)

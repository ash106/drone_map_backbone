class DroneMapBackbone.Views.StrikesIndex extends Backbone.View

  template: HandlebarsTemplates['strikes/index']

  initialize: ->
    @listenTo(@collection, 'reset', @render)

  render: ->
    @$el.html(@template(strikes: @collection))
    @collection.each(@appendStrike)
    if @collection.length
      @map = @gm_init()
    this

  appendStrike: (strike) ->
    view = new DroneMapBackbone.Views.Strike(model: strike)
    $('#strikes').append(view.render().el)

  gm_init: ->
    mapOptions =
      center: new google.maps.LatLng(-34.397, 150.644)
      zoom: 8
      mapTypeId: google.maps.MapTypeId.ROADMAP
    new google.maps.Map($("#map_canvas")[0], mapOptions)

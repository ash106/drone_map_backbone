class DroneMapBackbone.Routers.Strikes extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @strikes = new DroneMapBackbone.Collections.Strikes()
    @strikesView = new DroneMapBackbone.Views.StrikesIndex(collection: @strikes)
    @strikesView.render()
    $('#container').html(@strikesView.el)

  index: ->
    @strikes.fetch(reset: true)

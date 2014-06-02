window.DroneMapBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new DroneMapBackbone.Routers.Strikes
    Backbone.history.start()

$(document).ready ->
  DroneMapBackbone.initialize()

class DroneMapBackbone.Collections.Strikes extends Backbone.Collection
  url: 'http://api.dronestre.am/data'

  sync: (method, model, options) ->   
    options.dataType = "jsonp"  
    Backbone.sync method, model, options

  parse: (response) ->
    @status = response.status
    response.strike

  model: DroneMapBackbone.Models.Strike

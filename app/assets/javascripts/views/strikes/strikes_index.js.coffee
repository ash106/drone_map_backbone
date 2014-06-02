class DroneMapBackbone.Views.StrikesIndex extends Backbone.View

  template: HandlebarsTemplates['strikes/index']

  initialize: ->
    @listenTo(@collection, 'reset', @render)

  render: ->
    @$el.html(@template(strikes: @collection))
    @collection.each(@appendStrike)
    this

  appendStrike: (strike) ->
    view = new DroneMapBackbone.Views.Strike(model: strike)
    $('#strikes').append(view.render().el)

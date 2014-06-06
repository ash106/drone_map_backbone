class DroneMapBackbone.Views.Strike extends Backbone.View
  tagName: 'tr'
  template: HandlebarsTemplates['strikes/strike']

  events:
    'mouseenter': 'toggleHighlight'
    'mouseleave': 'toggleHighlight'
    'click': 'setCurrentStrike'

  initialize: (options) ->
    @options = options || {}
  
  render: ->
    @$el.html(@template(strike: @model.toJSON()))
    this

  toggleHighlight: ->
    @$el.toggleClass('hover')

  setCurrentStrike: ->
    alert "##{@model.get('number')} - #{@options.marker.getPosition()}"
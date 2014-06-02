class DroneMapBackbone.Views.Strike extends Backbone.View
  tagName: 'li'
  template: HandlebarsTemplates['strikes/strike']

  events:
    'mouseenter': 'toggleHighlight'
    'mouseleave': 'toggleHighlight'
  
  render: ->
    @$el.html(@template(strike: @model.toJSON()))
    this

  toggleHighlight: ->
    @$el.toggleClass('hover')
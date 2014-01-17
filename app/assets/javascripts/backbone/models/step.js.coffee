class Fridge.Models.Step extends Backbone.Model
  paramRoot: 'step'
  urlRoot: '/steps'

  url = () ->  
    this.urlRoot + "/" + this.id

class Fridge.Collections.StepsCollection extends Backbone.Collection
  model: Fridge.Models.Step
  url: '/steps'

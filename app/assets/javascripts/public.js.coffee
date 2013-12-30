#= require_self
#= require_tree ./public

window.Public ||= {}

Public.initiatedClasses = {}

Public.UTIL =
  exec: (controller, action = 'all_actions') ->
    if Public[controller]
      klass = Public.initiatedClasses[controller] ||= new Public[controller]

      if typeof klass is "object" and typeof klass[action] is "function"
        klass[action]() # call the function

  init: ->
    body = $("body")
    controller = body.data("router-class")
    action = body.data("router-action")

    this.exec "CommonController"
    this.exec "CommonController", action
    this.exec controller
    this.exec controller, action

$(document).ready -> Public.UTIL.init()
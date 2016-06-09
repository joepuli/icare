#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require tether
#= require bootstrap
#= require turbolinks
#= require main
#= require underscore
#= require gmaps/google
#= require map

class @App.DynamicFields
  # constructor: ->
  #   addFields()
  #   removeFields()

  addFields: ->
    $('form').on 'click', '.add_fields', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(@).data('id'), 'g')
      $(@).before($(@).data('fields').replace(regexp, time))
      event.preventDefault()

  removeFields: ->
    $('form').on 'click', '.remove_fields', (event) ->
      $(@).prev('input[type=hidden]').val('1')
      $(@).closest('.partial').hide()
      event.preventDefault()

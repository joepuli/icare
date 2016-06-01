@App ||= {}
document.addEventListener 'turbolinks:load', ->
  $('a[href^="/documents/"]').attr('target', '_blank')

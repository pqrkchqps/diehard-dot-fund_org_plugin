#= require ahoy

ahoy.trackAll()

$(document).on 'click', '.header__menu-resource-dropdown', (e) ->
  $(@).toggle()
  $(@).parent().attr 'aria-expanded', $(@).is(':visible')

$(document).on 'click', '.header__resources-dropdown', (e) ->
  menu = $('.header__resources-dropdown-menu')
  menu.css('display', if menu.css('display') == 'block' then 'none' else 'block')
  $(@).attr 'aria-expanded', menu.is(':visible')

$(document).on 'click', '.header__menu-collapsed-button', (e) ->
  menu = $('.header__menu')
  menu.css('display', if menu.css('display') == 'flex' then 'none' else 'flex')
  $(@).attr 'aria-expanded', menu.is(':visible')

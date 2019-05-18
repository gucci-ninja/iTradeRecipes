# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
    console.log("hey")
    $('#tac-button').click ->
        console.log('jiiii')
        #$('#extra-tacs').append '<input id="recipe_ingredients" multiple="multiple" type="text" value="" name="recipe[ingredients][]"><br>'
        return
    return
    
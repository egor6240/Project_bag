# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document)
  .off('click', '.delete_btn')
  .off('click', '.minus_btn')
  .off('click', '.plus_btn')
  .off('click', '.filter')
  .on 'click', '.delete_btn', (e) ->
      $.ajax({
         type: "POST"
         url: "/bag/delete_item"
         data: {id: $(this).data('id')}
      })
   .on 'click', '.minus_btn', (e) ->
      $.ajax({
         type: "POST"
         url: "/bag/quantity_item"
         data: {minus: true, id: $(this).data('id')}
      })
   .on 'click', '.plus_btn', (e) ->
      $.ajax({
         type: "POST"
         url: "/bag/quantity_item"
         data: {plus: true, id: $(this).data('id')}
      })
   .on 'click', '.filter', (e) ->
      $(".form_filter").fadeOut(100, ->
        $(this).remove()
      )
      return false if $(".form_filter").is(":visible")  
      $.ajax({
         type: "POST"
         url: "/bag/view_filter"
      })

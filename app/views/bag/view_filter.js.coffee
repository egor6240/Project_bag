$('.form_filter').remove()
html="<%= j render partial: 'view_filter', locals: {items: @items} %>"
$('.title').append(html)
$('.form_filter').fadeIn(200)
$('#select_filter').change (e) ->
   $.ajax({
      type: "POST"
      url: "/bag/filter"
      data: {filter: $('#select_filter').val()}
   })
   $('.form_filter').remove()
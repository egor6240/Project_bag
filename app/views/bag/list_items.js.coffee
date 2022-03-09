html="<%= j render partial: 'list_items', locals: {items: @filter} %>"
$('.items').html(html)
$('.span_quantity-<%= @item.id %>').html(" <%= @item.quantity %> ")
$('.total-price-<%= @item.id %>').html(" $<%= @item.price %> ")
$('.total').html(" TOTAL: $<%= @cost.floor(2) %> (<%= @quantity %> item) ")
@decrement_items_in_cart = ->
  change_items_in_cart(-1)

@increment_items_in_cart = ->
  change_items_in_cart(1)

change_items_in_cart = (n) ->
  element = $("#items-in-cart")
  count = element.text()
  element.text(parseInt(count) + n)

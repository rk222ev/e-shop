increment_items = ->
  element = $("#items-in-cart")
  count = element.text()
  element.text(parseInt(count) + 1)

increment_items()

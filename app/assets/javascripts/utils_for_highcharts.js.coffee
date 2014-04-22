# check if using IE8
app.is_ie8_browser ||= ->
  $("meta[browser='ie8']").length

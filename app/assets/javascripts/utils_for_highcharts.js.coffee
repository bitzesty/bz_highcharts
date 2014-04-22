# check if using IE
app.is_ie_browser ||= ->
  $("meta[browser='ie']").length

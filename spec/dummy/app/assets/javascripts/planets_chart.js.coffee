$ ->
  ## Planets chart
  chart_finder = "#planets-chart"
  $dataset_form = $("form#change-chart-dataset")

  if $(chart_finder).length
    # initialize chart
    chart = new app.PlanetsChart(chart_finder)

    # # reload chart to fix IE issue if that occurs
    # if app.is_ie_browser()
    #   setTimeout ->
    #     chart.reload()
    #   , 2000

    # submit on select change
    $dataset_form.find("#chart_dataset").change (e) ->
      $dataset_form.submit()

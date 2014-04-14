class app.PlanetsChart extends app.Chart
  type: =>
    "stackedbar"

  custom_chart_options: =>
    chart:
      renderTo: @element[0]
      marginTop: 0
      marginBottom: 50
    legend:
      enabled: false
    yAxis:
      labels:
        enabled: true

  render: (response) =>
    data = @data_from(response)
    options =
      series: data["counts"]
      xAxis:
        categories: data["years"]

    @update_with_new_options options

  register_events: =>
    # reload chart on discipline select change
    $("#change-chart-dataset").submit (e) =>
      e.preventDefault()
      $form = $(e.target)
      @url = "#{$form.attr("action")}?#{$form.serialize()}"
      @reload() if @url?

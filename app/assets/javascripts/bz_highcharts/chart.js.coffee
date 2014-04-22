class app.Chart
  constructor: (finder) ->
    @element = $(finder)
    @url = @element.data('url')

    @initChart()
    @register_events()
    @reload()

  # default chart type
  type: =>
    "bar"

  initChart: =>
    options = deepmerge @chart_options("common"), @chart_options(@type())
    options = deepmerge options, @custom_chart_options()
    @chart = new Highcharts.Chart(options)

  chart_options: (type) =>
    # set options depending on type
    app.ChartOptions[type]

  custom_chart_options: =>
    chart:
      renderTo: @element[0]
      marginTop: 0
      marginBottom: 50

  register_events: =>
    # no nothing by default

    # example of reloading chart on click
    # $("#chart-update-trigger").click (e) =>
    #   e.preventDefault()
    #   @url = $(e.target).data("url")
    #   @reload() if @url?

  disableShowLoading: =>
    # IE8 might not be stable with show loading not disabled
    false

  reload: () =>
    $.ajax
      url: @url
      type: "GET"
      dataType: "json"
      beforeSend: =>
        if app.is_ie8_browser() && @disableShowLoading()
          # cannot use showLoading for IE8 in some cases
        else
          @chart.showLoading()
      success: @render

  render: (response) =>
    # does nothing by default

    # rendering example
    # data = @data_from(response)
    # options =
    #   series: data["counts"]
    #   xAxis:
    #     categories: data["years"]

    # @update_with_new_options options

  update_with_new_options: (options) =>
    # create new chart with new options
    previous_options = @chart.options
    @remove_old_chart()

    # do not polute with old series
    delete(previous_options["series"]) if previous_options["series"]?
    new_options = deepmerge previous_options, options
    @chart = new Highcharts.Chart(new_options)

  remove_old_chart: =>
    # remove in IE8 friendly way
    if @chart && @chart.options.chart.renderTo
      @chart.destroy()
    else
      # chart not properly initiated, removing it
      @element.html("")
      @element.removeAttr("data-highcharts-chart")

  # returs data from response
  # where response can be of the following forms:
  #   { value_type: :multiple, data: data }
  #   data
  data_from: (response) =>
    if response.value_type?
      response.data
    else
      response

  # returs value type from response when defined
  value_type_from: (response) =>
    if response.value_type?
      response.value_type

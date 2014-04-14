class app.ChartHelpers
  @graph_colors = [
    '#1c1e45'
    '#004678'
    '#3783b9'
    '#0aa6c2'
    '#09b8a3'
  ]

  @chart_colors = [
    '#09b8a3'
    '#0aa6c2'
    '#3783b9'
    '#004678'
    '#1c1e45'
  ]

  @graph_colors_highlight = '#09b8a3'
  @graph_line_color = ['#3783b9']

  # GRAPH COLOUR SELECT
  @graph_colour_multiple: (total) =>
    multiple = Math.floor(@graph_colors.length / total)

  @graph_colour_loop: (index) =>
    total = @graph_colors.length
    color = index % total

  @bar_color_loop: (index) =>
    total = @graph_colors.length - 1
    color = total - Math.abs((index % (total * 2)) - total)

  @resizeCharts: =>
    clearTimeout(@resizeTimer) if @resizeTimer?
    @resizeTimer = setTimeout ( ->
      for chart in Highcharts.charts
        chart_el = $(chart.container)
        chart_container = chart_el.closest(".js-highcharts").parent()
        chart_el.hide()
        chart.setSize(chart_container.width(), chart.containerHeight, false)
        chart_el.show()
    ), 50

  # resize charts on window resized
  $(window).resize =>
    @resizeCharts()

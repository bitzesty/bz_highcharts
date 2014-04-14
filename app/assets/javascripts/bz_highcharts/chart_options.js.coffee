app.ChartOptions =
  common:
    credits:
      enabled: false

    chart:
      marginTop: null
      marginBottom: null
      marginLeft: null
      marginRight: null
      spacingTop: 10
      spacingBottom: 15
      spacingLeft: 10
      spacingRight: 10

    legend:
      enabled: true
      padding: 8
      borderWidth: 1
      layout: 'horizontal'
      itemMarginBottom: 0
      symbolWidth: 30
      labelFormat: "name"
      reversed: false

    title:
      text: false

    xAxis:
      type: 'linear'
      categories: null
      labels:
        style:
          color: '#000'
          fontSize: '11px'
      lineColor: '#c7c7c7'

    yAxis:
      stackLabels:
        enabled: false
        y: null
        style:
          color: '#000'
          fontWeight: 'normal'
          fontSize: '11px'
      labels:
        style:
          color: '#000'
          fontSize: '11px'
      title:
        text: false
        rotation: 270
        align: 'middle'
        offset: null
        margin: 40
        y: null
        style:
          color: "#000"
          fontWeight: 'normal'
          fontSize: '11px'
      gridLineWidth: 1
      lineColor: '#c7c7c7'
      lineWidth: 0
      min: null
      max: null
      tickInterval: null

    tooltip:
      formatter: null
      useHTML: true
      backgroundColor: "rgba(2552552550)"
      borderWidth: 0
      shadow: false

    plotOptions:
      series:
        stacking: null
        pointStart: 0
        animation: false
      column:
        dataLabels:
          enabled: false
          color: '#000'
          formatter: null
      bar:
        colorByPoint: false
        dataLabels:
          enabled: true
          color: '#000'
          x: 5
          align: 'left'
      pie:
        dataLabels:
          enabled: true
          distance: 30
          color: '#000'
        showInLegend: false
    series: [{}]

  pie:
    chart:
      marginTop: 0
    title:
      text: false
    legend:
      enabled: false
      padding: 0
      borderWidth: 0
      layout: 'vertical'
      itemMarginBottom: 5
      symbolWidth: 12
      labelFormat: "name y%"
    plotOptions:
      pie:
        size: '110%'
        innerSize: '60%'
        borderWidth: 0
        dataLabels:
          enabled: true
          distance: -20
          color: '#fff'
          formatter: ->
            if this.y == 0
              return ""
            else
              return app.ChartFormatter.round_if_numeric(this.y)+"%"
        showInLegend: true
        point:
          events:
            legendItemClick: ->
              return false

  bar:
    chart:
      type: 'column'

    title: false

    yAxis:
      title: false
      labels: false
      gridLineWidth: 0

    xAxis:
      minorTickLength: 0
      tickLength: 0

    plotOptions:
      series:
        stacking: 'normal'
      column:
        dataLabels:
          enabled: true
          color: '#fff'
          formatter: ->
            app.ChartFormatter.round_if_numeric(this.y)

  bar_across:
    chart:
      type: 'bar'

    legend:
      enabled: false

    title: false

    yAxis:
      title: false
      labels: false
      gridLineWidth: 0

    xAxis:
      minorTickLength: 0
      tickLength: 0

    plotOptions:
      bar:
        dataLabels:
          crop: false
          enabled: true
          x: 8
      series:
        dataLabels:
          overflow: "none"
      column:
        dataLabels:
          formatter: ->
            app.ChartFormatter.round_if_numeric(this.y)

  bar_across_colourful:
    chart:
      type: 'bar'
      marginRight: 15

    legend:
      enabled: false

    title:
      text: false

    xAxis:
      labels:
        style:
          color: '#000'
        y: 3
        useHTML: "true"

      lineColor: '#c7c7c7'
      minorTickLength: 0
      tickLength: 0

    yAxis:
      labels: false
      title:
        text: false
      gridLineWidth: 0

    plotOptions:
      bar:
        dataLabels:
          crop: false
          enabled: true
          color: '#000'
          x: 5
          y: -1
          formatter: ->
            app.ChartFormatter.round_if_numeric(this.y)
      series:
        dataLabels:
          overflow: "none"

  stackedbar:
    chart:
      type: 'column'
      marginTop: 20

    title:
      text: false

    legend:
      padding: 0
      borderWidth: 0
      itemMarginBottom: 5
      symbolWidth: 12
      reversed: true
      labelFormat: "name"

    xAxis:
      labels:
        style:
          color: '#000'
      lineColor: '#c7c7c7'
      minorTickLength: 0
      tickLength: 0

    yAxis:
      labels: false
      title:
        text: false
      gridLineWidth: 0
      stackLabels:
        enabled: true
        y: -15
        style:
          color: '#000'
          fontWeight: 'bold'
        formatter: ->
          app.ChartFormatter.round_if_numeric(this.total)

    plotOptions:
      series:
        stacking: 'normal'
      column:
        dataLabels:
          enabled: true
          color: '#fff'
          formatter: ->
            if this.y > 0
              app.ChartFormatter.round_if_numeric(this.y)
        events:
          legendItemClick: ->
            return false
      allowPointSelect: false

  line:
    chart:
      type: 'line'
      marginTop: 20

    xAxis:
      type: 'datetime'
      dateTimeLabelFormats:
        month: "%b '%y"

    yAxis:
      title:
        text: 'CHF'
        rotation: 0
        align: 'high'
        offset: 0
        margin: 100
        y: -10
        style:
          color: "#000"
          fontWeight: 'normal'
      labels:
        enabled: true
      gridLineWidth: 1
      lineWidth: 2
      lineColor: '#c7c7c7'
      stackLabels: false

    legend:
      enabled: false

    plotOptions:
      line:
        marker:
          fillColor: 'transparent'
        lineWidth: 2

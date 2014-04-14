class app.ChartFormatter
  @round_if_numeric: (value) =>
    if typeof value == 'number'
      Math.round(value * 100) / 100
    else
      value

  @data_formatter: (value, value_type = null) =>
    value = @round_if_numeric value

    if value_type?
      value + @symbol_for(value_type)
    else
      value

  @symbol_for: (value_type) =>
    if value_type?
      switch value_type
        when "multiple" then "x"
        else ""

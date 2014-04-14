class ChartsController < ApplicationController
  respond_to :html, :json

  def index
  end

  def chart_data
    # delay to see chart loading
    sleep 1
    render status: :ok,
           json: dataset
  end

  private

  def dataset
    if params.fetch(:chart, {})[:dataset] == "second"
      {
        years: [2000, 2001, 2002],
        counts: [
          { name: "Stars", data: [1, 2, 3] },
          { name: "Planets", data: [3, 2, 5] }
        ]
      }
    else
      {
        years: [2000, 2001, 2002],
        counts: [
          { name: "Stars", data: [10, 0, 3] },
          { name: "Planets", data: [13, 2, 2] }
        ]
      }
    end
  end
end

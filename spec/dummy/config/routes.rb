Dummy::Application.routes.draw do
  root 'charts#index'

  resources :charts, only: :index do
    collection {
      get :chart_data
    }
  end
end

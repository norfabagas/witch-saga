Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/', to: 'core#index'
      get '/killed_by_year', to: 'core#killed_by_year'
      post '/person_information', to: 'core#person_information'
      post '/solution', to: 'core#solution'
    end
  end
end

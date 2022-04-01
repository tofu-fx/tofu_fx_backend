Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/google_sheets/:selection_1/:selection_2/:sheet_id', to: 'google_sheets#index'

end

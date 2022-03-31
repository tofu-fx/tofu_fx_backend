Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about_me', to: 'about_me#index'
  get 'socials', to: 'socials#index'
end

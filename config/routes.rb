Rails.application.routes.draw do
  devise_for :customers,skip:[:passwords], controller:{
   registration: "public/registrations",
   sessions: 'public/sessions'
  }
  
  devise_for :admins,skip:[:registrations, :passwords],controller:{
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items
  end
  
  namespace :public do
    resources :items
  end

end

Rails.application.routes.draw do
 
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :genres, except: [:show, :destroy, :new]
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders
  end
  
  namespace :public do
    resources :items
  end

end

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
  
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  
  namespace :public do
    resources :orders
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks', to: 'orders#thanks'
    resources :items, only: [:index, :show]
    resources :customers,except: [:new, :index]
    resources :addresses,except: [:new, :show]
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :cart_items, except: [:show, :new, :edit] 
    delete 'cart_items' => 'cart_items#destroy_all'
  end

end

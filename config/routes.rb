Rails.application.routes.draw do
  resources :products
  resources :ebay_auths
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'


    get 'ebay_accept', to: 'welcome#ebay_accept'
    get '/token', to: 'ebay_auths#token'

    get '/productos', to: 'products#productos'


    ### api 

    get '/get_item', to: 'ebay_auths#get_item'
    
    
end

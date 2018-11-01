Rails.application.routes.draw do
  resources :costs do 
    collection {post :import}
  end
  resources :products do 
  	collection {post :traer_data}
  end
  resources :ebay_auths
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'


    get 'ebay_accept', to: 'welcome#ebay_accept'
    get '/token', to: 'ebay_auths#token'

    get '/productos', to: 'products#productos'
    get '/cargar_listings', to: 'products#cargar_listings'


    ### api 

    get '/get_item', to: 'ebay_auths#get_item'
    
    
end

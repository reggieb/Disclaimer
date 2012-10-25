Disclaimer::Engine.routes.draw do
  
  root :to => "documents#index"
  
  resources :documents do
    member do
      get :delete
      post :accept
    end
  end
  
  resources :segments do
    member do
      get :delete
    end
  end

end

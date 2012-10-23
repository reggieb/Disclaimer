Disclaimer::Engine.routes.draw do
  
  resources :documents do
    member do
      get :delete
    end
  end

end

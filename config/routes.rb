Disclaimer::Engine.routes.draw do
  
  if Disclaimer.enable_crud?
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
    
  else
  
   resources :documents, :only => :show do
      member do
        post :accept
      end
    end
    

    
  end
    

end

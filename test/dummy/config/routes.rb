Rails.application.routes.draw do
  
  root :to => 'sample#index'
  
  resources :sample, :only => [:index] do
    collection do
      get :bypass_disclaimer
    end
  end

  mount Disclaimer::Engine => "/disclaimer"
end

Rails.application.routes.draw do

  resources :sample, :only => [:index] do
    collection do
      get :bypass_disclaimer
    end
  end

  mount Disclaimer::Engine => "/disclaimer"
end

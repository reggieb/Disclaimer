Rails.application.routes.draw do

  resources :sample, :only => [:index]

  mount Disclaimer::Engine => "/disclaimer"
end

Broker88::Application.routes.draw do
  root :to => 'carriers#index'

  resources :carriers, :customers, :shippers

  resources :loads do
    get :autocomplete_carrier_name, :on => :collection
    get :autocomplete_customer_name, :on => :collection
    get :autocomplete_shipper_name, :on => :collection
  end

  resources :import do
    get :carrier
    get :load
    get :customer
  end 

end

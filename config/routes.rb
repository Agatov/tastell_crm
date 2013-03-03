Crm::Application.routes.draw do

  root to: 'places#index'

  resources :places
  resources :users do
    resources :comments

    get :login, on: :collection, action: 'login_page'
    post :login, on: :collection
    delete :logout, on: :collection
  end
end

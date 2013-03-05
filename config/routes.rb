Crm::Application.routes.draw do

  root to: 'places#index'

  resources :places do
    put :state, on: :member
    resources :comments
  end

  resources :users do
    get :login, on: :collection, action: 'login_page'
    post :login, on: :collection
    delete :logout, on: :collection
  end
end

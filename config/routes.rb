Crm::Application.routes.draw do
  resources :places
  resources :users do
    resources :comments
  end
end

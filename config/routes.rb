# config/routes.rb

Rails.application.routes.draw do
  resources :dados, only: [:index, :new, :create] do
    collection { post :importar }
    delete :limpar_tela, on: :collection
  end

  root 'dados#index'
end

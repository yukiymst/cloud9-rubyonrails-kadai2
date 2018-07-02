Rails.application.routes.draw do
  # get 'hitokotos/index'
  resources :hitokotos do
    collection do
      post :confirm
    end
  end
end

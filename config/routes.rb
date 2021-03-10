Rails.application.routes.draw do
  
  get 'home/index'
  root "home#index"

  get 'albums/index'
   get 'albums/new'
    get 'albums/edit'
     get 'albums/show'
      get 'albums/delete'
 
resources :albums do
  member do
    delete "delete_upload/:upload_id", action: :delete_upload, as: :delete_upload
  end
end
  resources :albums




    devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

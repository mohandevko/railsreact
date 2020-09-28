Rails.application.routes.draw do
  namespace :v1 do
    get 'mappings/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: {format: 'json'} do
  	get 'mappings', to: 'mappings/index'
  end


  resources :uploads
  root 'uploads#index'
  match 'import', to: 'uploads#import', via: 'get'
  match 'upload_data', to: 'uploads#upload_data', via: 'post'
  match 'delete_data', to: 'uploads#delete_data', via: 'delete'

end

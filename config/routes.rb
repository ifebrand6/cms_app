Rails.application.routes.draw do
  

  # get 'public/index'

  # get 'public/show'

  # get 'admin_user/index'

  # get 'admin_user/new'

  # get 'admin_user/edit'

  # get 'admin_user/delete'

  # get 'access/index'

  # get 'access/login'

  # get 'sections/index'

  # get 'sections/:id' => 'sections#show', as: :show_section

  # get 'sections/new'

  # get 'sections/edit'

  # get 'sections/delete'

  # get 'pages/index'

  # get 'pages/show'

  # get 'pages/new'

  # get 'pages/edit'

  # get 'pages/delete'

  # get 'show-subject' => 'subjects#show'

  # get 'subjects/show'

  # get 'subjects/new'

  # get 'subjects/edit'

  # get 'subjects/delete'

	root 'public#index'
  get 'show/:permalink', :to => 'public#show'
  # get 'demo/index'
  get 'admin'  => 'access#index'
  match ':controller(/:action(/:id))' , :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
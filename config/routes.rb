Rails.application.routes.draw do

  resources :advertisement

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end 
Rails.application.routes.draw do

  resources :posts, :questions

  get 'about' => 'welcome#about'
  get 'questions' => 'welcome#questions'

  root to: 'welcome#index'
end 
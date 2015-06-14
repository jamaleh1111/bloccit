Rails.application.routes.draw do

  devise_for :users

  resources :posts 
  resources :questions
  resources :advertisements

  get 'about' => 'welcome#about'

  get 'advertisements' => 'welcome#about'

  get 'questions' => 'welcome#questions'

  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'
end 
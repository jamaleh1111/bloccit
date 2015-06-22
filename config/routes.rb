Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:update]
  resources :questions
  resources :advertisements

  resources :topics do
    resources :posts, except: [:index]
 end 
  
  get 'users' => 'users#update'

  get 'about' => 'welcome#about'

  get 'advertisements' => 'welcome#about'

  get 'questions' => 'welcome#questions'

  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'
end 
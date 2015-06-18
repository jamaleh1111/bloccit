Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries, only: [:new, :create, :show]
    end 
 end 
  
  resources :questions
  resources :advertisements


  get 'about' => 'welcome#about'

  get 'advertisements' => 'welcome#about'

  get 'questions' => 'welcome#questions'

  get 'contact' => 'welcome#contact'

  root to: 'welcome#index'
end 
Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resources :summaries, except: [:index]
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
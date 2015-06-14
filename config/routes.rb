Rails.application.routes.draw do

<<<<<<< HEAD
  devise_for :users
  resources :posts
=======
  resources :posts, :questions
>>>>>>> a-35-crud

  resources :advertisements

  get 'about' => 'welcome#about'
<<<<<<< HEAD
  get 'advertisements' => 'welcome#about'
=======
  get 'questions' => 'welcome#questions'
>>>>>>> a-35-crud

  root to: 'welcome#index'
end 
Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/categories/:category_id/papers/:id/read' ,to:'papers#read_status'
  resources :categories do
    resources :papers do
      resources :comments, only: :create do
        resources :student_comment_ratings
      end
      resources :genres_papers, only: :create
      resources :ratings, only: :create
    end
  end

  get '/papers', to: 'papers#index'

  root 'categories#index'
end

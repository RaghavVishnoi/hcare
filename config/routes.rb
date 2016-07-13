Rails.application.routes.draw do
  

  namespace :api do
      api_version(
          module: "V1",
          header: { name: "Accept", value: "application/vnd.hcare+json; version=1" },
          defaults: { format: :json }
        ) do
          resources :passwords, only: [:create, :new, :update]
          resource :session, only: [:create]

          resources :users, only: [:create] do
            resource :password, only: [:create, :edit, :update]
          end

          post "/facebook_auth", to: 'users#facebook_auth'
          post "/google_auth",to: 'users#google_auth'

          resources :states, only: [:index]
          resources :categories, only: [:index]
          resources :trainers, only: [:index,:create,:show]
          resources :centers, only: [:index,:create,:show]

          resource :trainer do
            collection do 
              patch ':id/like' => "trainers#like"
              get ':id/likes' => "trainers#likes"
              post ':id/rating' => "trainers#rating"
              get ':id/ratings' => "trainers#ratings"
              post ':id/request' => "requests#create"
            end
          end

          resources :center do
            collection do
              patch ':id/like' => "centers#like"
              get ":id/likes" => "centers#likes"
              post ":id/rating" => "centers#rating"
              get ":id/ratings" => "centers#ratings"
            end
          end

          post "trainers/:id/like" => "trainer_likes#create"
          get "trainer_likes/:trainer_id", to: 'trainer_likes#show'
    
          resources :trainer_reviews, only: [:create]
          get "trainer_reviews/:trainer_id", to: 'trainer_reviews#show'
          get "/search/trainers", to: 'trainers#search'

          resources :requests, only: [:create,:show]

          resources :messages, only: [:create]

          resources :images, only: [:create,:show]

    end
  end 
      resources :view_pagers, only: [:index,:create,:update]
      resources :view_pagers do
        collection do
          patch ":id/status" => "view_pagers#status"
        end
      end
      resources :home_workouts, only: [:index,:create,:update,:show]
      resources :first_aids, only: [:index,:create,:show]


end

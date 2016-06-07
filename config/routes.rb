Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions'
                                  }

  resources :profiles do
    resources :agencies
    resources :homes
    resources :parents
    resources :children
    resources :preferences
  end
  namespace :ujs do
    resources :trainings, :courses, :preferences,
              only: [:edit, :update, :destroy]
  end
  root to: 'welcome#index'
end

Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  namespace :account do
    resources :legal_document_approvals, only: %i[new create]
    resource :profiles, only: %i[show edit update]
  end

  namespace :admin do
    resources :articles
    resources :categories
  end
  
  resources :legal_documents
end

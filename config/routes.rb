Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  namespace :account do
    resources :legal_document_approvals, only: %i[new create]
    resource :profiles, only: %i[show edit update]
  end

  namespace :admin do
    resources :articles
    resources :article_sizes, only: %i[destroy]
    resources :article_colors, only: %i[destroy]
    resources :article_categories, only: %i[destroy]
    resources :categories
  end
  
  resources :legal_documents
end

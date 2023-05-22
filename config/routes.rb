# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :articles, only: %i[show]

  namespace :account do
    resources :legal_document_approvals, only: %i[new create]
    resource :profiles, only: %i[show edit update destroy]
    resource :professionals, only: %i[new create edit update]
    resource :cart, only: %i[show update destroy]
  end

  namespace :admin do
    get '/', controller: 'home', action: 'index'
    resources :articles
    resources :article_sizes, only: %i[destroy update]
    resources :article_colors, only: %i[destroy]
    resources :article_categories, only: %i[destroy]
    resources :categories
    resources :user_managements, only: %i[index show destroy]
    resources :legal_documents
  end

  resources :legal_documents, only: %i[index show]
  resources :contact, only: %i[index create]
end

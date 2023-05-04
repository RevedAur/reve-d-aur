Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  namespace :my_account do
    resources :legal_document_approvals, only: %i[new create index show]
    resource :accounts, only: :show
  end

  resources :legal_documents
end

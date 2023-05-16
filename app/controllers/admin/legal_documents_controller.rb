# frozen_string_literal: true

module Admin
  class LegalDocumentsController < ApplicationController
    before_action :legal_document, only: %i[show edit update]

    def index
      @legal_documents = LegalDocument.online
    end

    def new
      @new_legal_document = LegalDocument.new
    end

    def create
      new_legal_document = LegalDocument.new(legal_document_params)
      new_legal_document.assign_attributes(online: true, online_at: DateTime.now)

      if new_legal_document.save
        flash[:notice] = 'Nouveau document créé'
      elsif new_legal_document.errors.messages.any?
        flash[:error] = new_legal_document.errors.messages
      end
      redirect_to admin_legal_documents_path
    end

    def show; end

    def edit; end

    def update
      new_legal_document = LegalDocument.new
      new_legal_document.assign_attributes(legal_document_params)
      ::LegalDocumentService::EditingDocument.new(new_legal_document).perform

      flash[:notice] = 'Document modifié'
      redirect_to admin_legal_documents_path
    end

    private

    def legal_document
      @legal_document ||= LegalDocument.find(params[:id])
    end

    def legal_document_params
      params.require(:legal_document).permit(:content, :nature)
    end
  end
end

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
    ::NewLegalDocument::Document.new(new_legal_document).perform
  end

  def show
  end

  def edit
  end

  def update
    legal_document.assign_attributes(legal_document_params)
    ::NewLegalDocument::Document.new(legal_document).perform
  end

  private

  def legal_document
    @legal_document ||= LegalDocument.find(params[:id])
  end

  def legal_document_params
    params.require(:legal_document).permit(:content, :nature)
  end
end

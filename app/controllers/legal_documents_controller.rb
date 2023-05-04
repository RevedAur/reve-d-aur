class LegalDocumentsController < ApplicationController
  before_action :legal_document, only: %i[show edit update]

  def index
    @legal_documents = LegalDocument.online
  end

  def create
    @legal_document = LegalDocument.new(legal_document_params)
    legal_document = ::NewLegalDocument::Document.new(@legal_document).perform

    if legal_document.save
      redirect_to root_path
    else
      flash.now[:notice] = "ça marche pas !"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    content = params[:legal_document][:content]
    new_legal_document = ::NewLegalDocument::Document.new(legal_document, content).perform

    redirect_to legal_document_path(new_legal_document)
  end

  private

  def legal_document
    @legal_document ||= LegalDocument.find(params[:id])
  end
end

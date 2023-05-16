# frozen_string_literal: true

class LegalDocumentsController < ApplicationController
  def index
    @legal_documents = LegalDocument.online
  end

  def show
    @legal_document ||= LegalDocument.find(params[:id])
  end
end

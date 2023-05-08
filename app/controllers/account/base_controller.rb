# frozen_string_literal: true

module Account
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :documents_to_sign

    private

    def documents_to_sign
      legal_documents = LegalDocument.online
      if LegalDocumentApproval.where(user: current_user, legal_document: legal_documents).count < legal_documents.count
        flash[:notice] = "Vous devez accepter les conditions générales si vous souhaitez poursuivre sur le site."
        redirect_to new_account_legal_document_approval_path
      end
    end
  end
end

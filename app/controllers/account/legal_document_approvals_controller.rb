# frozen_string_literal: true

module Account
  class LegalDocumentApprovalsController < ApplicationController
    before_action :documents_to_sign, only: %i[new]
    before_action :new_legal_document_approval, only: %i[new]

    def new
    end

    def create
      legal_document_approval = LegalDocumentApproval.new(
        user: current_user,
        legal_document: documents_to_sign.first,
        approved_at: DateTime.now,
      )
      if params[:sign] == "1"
        legal_document_approval.save
        flash[:notice] = "Le document a bien été signé."
        redirect_to account_profiles_path
      else
        flash[:error] = legal_document_approval.errors.messages if legal_document_approval.errors.messages.any?
        flash[:notice] = "Merci d'accepter les conditions pour continuer"
        redirect_to new_account_legal_document_approval_path
      end
    end

    private

    def documents_to_sign
      @document_to_sign ||= LegalDocument.online.filter_map do |legal_document|
        legal_document unless LegalDocumentApproval.find_by(user: current_user, legal_document: legal_document)
      end
    end

    def new_legal_document_approval
      @new_legal_document_approval ||= documents_to_sign.first
    end
  end
end

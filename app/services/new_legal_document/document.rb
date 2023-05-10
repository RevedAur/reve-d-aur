# frozen_string_literal: true

module NewLegalDocument
  class Document
    attr_accessor :document

    def initialize(document)
      @document = document
    end

    def perform
      change_previous_legal_document_status if editing_document
      create_new_legal_document
    end

    private

    def change_previous_legal_document_status
      old_legal_document.update(online: false)
    end

    def create_new_legal_document
      document.assign_attributes(online: true, online_at: DateTime.now)
      document.save!
    end

    def old_legal_document
      @old_legal_document ||= LegalDocument.where(nature: document.nature).find_by(online: true)
    end

    def editing_document
      LegalDocument.find_by(nature: document.nature)
    end
  end
end

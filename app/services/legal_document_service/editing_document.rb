# frozen_string_literal: true

module LegalDocumentService
  class EditingDocument
    attr_accessor :document

    def initialize(document)
      @document = document
    end

    def perform
      set_offline_previous_document
      new_legal_document
    end

    private

    def set_offline_previous_document
      old_legal_document.update(online: false)
    end

    def new_legal_document
      document.assign_attributes(online: true, online_at: DateTime.now)
      document.save!
    end

    def editing_document
      LegalDocument.find_by(nature: document.nature, online: true)
    end

    def old_legal_document
      @old_legal_document ||= LegalDocument.where(nature: document.nature).find_by(online: true)
    end

  end
end

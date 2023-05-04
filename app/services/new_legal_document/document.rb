# frozen_string_literal: true

module NewLegalDocument
  class Document
    attr_accessor :document, :nature, :content

    def initialize(document, content)
      @document = document
      @nature = document.nature
      @content = content
    end

    def perform
      change_previous_legal_document_status
      create_new_legal_document
    end

    private

    def change_previous_legal_document_status
      old_legal_document.update(online: false)
    end

    def create_new_legal_document
      LegalDocument.create!(
        online: true,
        online_at: DateTime.now,
        nature: nature,
        content: content,
      )
    end

    def old_legal_document
      @old_legal_document ||= LegalDocument.where(nature: @nature).find_by(online: true)
    end
  end
end

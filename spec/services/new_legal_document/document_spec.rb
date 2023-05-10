require "rails_helper"

RSpec.describe ::LegalDocumentService::EditingDocument, type: :service do
  let!(:legal_document) { create(:legal_document, nature: 'cgu') }
  let!(:new_document) { build(:legal_document, nature: 'cgu') }

  subject(:new_legal_document) { described_class.new(new_document) }

  describe 'perform' do
    it 'create a new legal document and set previous to offline' do
      expect(legal_document.online).to be true
      new_legal_document.perform
      expect(LegalDocument.count).to eq(2)
      expect(legal_document.reload.online).to be false
    end
  end
end

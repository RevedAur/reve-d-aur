require "rails_helper"

RSpec.describe LegalDocumentsController, type: :request do
  let!(:legal_document) { create(:legal_document) }

  describe 'GET /index' do
    it 'returns http success' do
      get legal_documents_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get legal_document_path(legal_document)
      expect(response).to have_http_status(200)
    end
  end
end

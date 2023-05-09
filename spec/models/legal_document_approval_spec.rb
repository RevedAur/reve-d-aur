require "rails_helper"

RSpec.describe LegalDocumentApproval, type: :model do
  let(:legal_document_approval) { build(:legal_document_approval) }

  it { expect(legal_document_approval).to be_valid }

  context 'when callbacks' do
    it 'set_approval_date' do
      expect { legal_document_approval.save! }.to change(legal_document_approval, :approved_at).from(nil)
    end
  end
end

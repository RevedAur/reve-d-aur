require "rails_helper"

RSpec.describe LegalDocument, type: :model do
  let(:legal_document) { build(:legal_document) }

  it { expect(legal_document).to be_valid }

  context 'when callbacks' do
    describe 'create_version' do
      it { expect { legal_document.save! }.to change(legal_document, :version).from(nil) }
    end
  end

  context 'when validation' do
    it 'when_online' do
      expect { create(:legal_document, online: true, online_at: nil) }
        .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Online at Une date de mise en ligne doit être renseignée')
    end

    it 'online_date' do
      expect { create(:legal_document, online_at: DateTime.yesterday) }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Online at La date de mise en ligne doit être supérieur à aujourd'hui")
    end
    
    describe 'nature_uniqueness' do
      let!(:legal_document) { create(:legal_document, nature: :cgu) }
      
      it 'raises if we set online a second CGU' do
        expect { create(:legal_document, nature: :cgu, online: true, online_at: DateTime.now) }
        .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Nature Il ne peut y avoir 2 documents de même nature en ligne')
      end
      
      it 'raises not when we update online LegalDocument' do
        expect { legal_document.update!(nature: :cgv) }.not_to raise_error
      end
      
      it 'raises not if we set offline a second CGU' do
        expect(create(:legal_document, nature: :cgu, online: false)).to be_valid
      end
    end
  end
end

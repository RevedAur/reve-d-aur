# frozen_string_literal: true

class LegalDocumentApproval < ApplicationRecord
  belongs_to :user
  belongs_to :legal_document

  before_create :set_approval_date

  private

  def set_approval_date
    self.approved_at = DateTime.now
  end
end

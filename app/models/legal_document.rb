class LegalDocument < ApplicationRecord
  has_rich_text :content

  has_many :legal_document_approvals
  has_many :users, through: :legal_document_approvals

  enum nature: {
    cgv: 0,
    cgu: 1,
  }

  validate :online_date
  validate :nature_uniqueness
  validate :when_online

  before_create :create_version

  def self.online
    where(online: true).order(online_at: :asc)
  end

  private

  def create_version
    date = DateTime.now
    self.version = "#{date.year}#{date.month}#{date.day}".to_i
  end

  def when_online
    return unless online
    return if online_at.present?

    errors.add(:online_at, "Une date de mise en ligne doit être renseignée")
  end

  def online_date
    return if online_at.nil?
    return if online_at >= DateTime.now.to_date

    errors.add(:online_at, "La date de mise en ligne doit être supérieur à aujourd'hui")
  end

  def nature_uniqueness
    return unless online
    return if LegalDocument.send(nature).where(online: true).where.not(id: id).count < 1

    errors.add(:nature, 'Il ne peut y avoir 2 documents de même nature en ligne')
  end
end

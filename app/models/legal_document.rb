class LegalDocument < ApplicationRecord
  has_many :legal_document_approvals
  has_many :users, through: :legal_document_approvals

  has_rich_text :content

  enum nature: {
    cgv: 0,
    cgu: 1,
  }

  validate :online_date
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
end

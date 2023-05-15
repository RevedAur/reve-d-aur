class ArticleSize < ApplicationRecord
  belongs_to :article
  belongs_to :size

  before_save :check_available

  validates_uniqueness_of :article, :scope => :size, 
                        :message=>"La taille existe déjà avec ce vêtement"

  def check_available
    self.available = true if self.number > 0
    self.available = false if self.number == 0
  end
end

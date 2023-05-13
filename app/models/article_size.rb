class ArticleSize < ApplicationRecord
  belongs_to :article
  belongs_to :size

  validates_uniqueness_of :article, :scope => :size, 
                        :message=>"La taille existe déjà avec ce vêtement"
end

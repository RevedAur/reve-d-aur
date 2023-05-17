# frozen_string_literal: true

module ArticleHelper
  def article_size(article, size)
    ArticleSize.find_by(article: article, size: size)
  end
end

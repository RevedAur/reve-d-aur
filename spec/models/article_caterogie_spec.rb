# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  let(:article_category) { build(:article_category) }

  it { expect(article_category).to be_valid }
end

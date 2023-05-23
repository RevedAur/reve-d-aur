# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleSize, type: :model do
  let(:article_size) { build(:article_size) }

  it { expect(article_size).to be_valid }
end

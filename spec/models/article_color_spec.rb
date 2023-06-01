# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleColor, type: :model do
  let(:article_color) { build(:article_color) }

  it { expect(article_color).to be_valid }
end

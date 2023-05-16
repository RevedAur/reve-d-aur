# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartArticle, type: :model do
  let(:cart_article) { build(:cart_article) }

  it { expect(cart_article).to be_valid }
end

require "rails_helper"

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }

  it { expect(article).to be_valid }

  it "is not valid with negatif value" do
    article.price = -1
    expect(article).to_not be_valid
  end
end

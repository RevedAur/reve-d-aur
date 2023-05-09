require "rails_helper"

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  it { expect(category).to be_valid }
end

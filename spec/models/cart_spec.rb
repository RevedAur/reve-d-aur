require "rails_helper"

RSpec.describe Cart, type: :model do
  let(:cart) { build(:cart) }

  it { expect(cart).to be_valid }
end

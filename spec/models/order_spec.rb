require "rails_helper"

RSpec.describe Order, type: :model do
  let(:order) { build(:order) }

  it { expect(order).to be_valid }
end

require "rails_helper"

RSpec.describe Professional, type: :model do
  let(:professional) { build(:professional) }

  it { expect(professional).to be_valid }
end

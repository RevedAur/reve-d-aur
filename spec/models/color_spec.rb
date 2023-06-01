# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Color, type: :model do
  let(:color) { build(:color) }

  it { expect(color).to be_valid }
end

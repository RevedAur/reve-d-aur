# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClothingModel, type: :model do
  let(:clothing_model) { build(:clothing_model) }

  it { expect(clothing_model).to be_valid }
end

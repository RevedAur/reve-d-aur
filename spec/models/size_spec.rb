# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Size, type: :model do
  let(:size) { build(:size) }

  it { expect(size).to be_valid }
end

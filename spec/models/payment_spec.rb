# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:payment) { build(:payment) }

  it { expect(payment).to be_valid }
end

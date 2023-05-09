# frozen_string_literal :true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { expect(user).to be_valid }

  describe 'Callbacks' do
    it 'creates a cart' do
      expect { create(:user).to change(::Cart, :count).by 1 }
    end
  end
end
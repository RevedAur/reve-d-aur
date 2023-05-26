# frozen_string_literal: true

class Size < ApplicationRecord
  enum name: {
    XXS: 0,
    XS: 1,
    S: 2,
    M: 3,
    L: 4,
    XL: 5,
    XXL: 6
  }
end

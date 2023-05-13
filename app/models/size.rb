class Size < ApplicationRecord
  enum name: {
    xxs: 0,
    xs: 1,
    s: 2,
    m: 3,
    l: 4,
    xl: 5,
    xxl: 6
  }
end

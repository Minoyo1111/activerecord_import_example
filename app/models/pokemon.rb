class Pokemon < ApplicationRecord
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 50 }
end

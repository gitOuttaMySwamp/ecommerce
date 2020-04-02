# frozen_string_literal: true

class Detail < ApplicationRecord
  has_many :piece

  validates :price, presence: true
end

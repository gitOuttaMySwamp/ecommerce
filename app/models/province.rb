# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :user

  validates :name, :code, presence: true
end

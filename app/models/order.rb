# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :pieces, through: :product_orders
end

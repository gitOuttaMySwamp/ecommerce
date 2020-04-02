# frozen_string_literal: true

class Piece < ApplicationRecord
  belongs_to :size, foreign_key: :sizeId
  belongs_to :detail, foreign_key: :detailId
  # has_many :pieceOrder

  validates :name, :sizeId, :detailId, presence: true
end

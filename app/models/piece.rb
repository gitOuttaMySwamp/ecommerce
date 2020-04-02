# frozen_string_literal: true

class Piece < ApplicationRecord
  belongs_to :size, foreign_key: :sizeId
  belongs_to :detail, foreign_key: :detailId
  # has_many :pieceOrder

  validates :name, :sizeId, :detailId, presence: true

  paginates_per 5
  max_paginates_per 100

  def self.search(search, size, page)
    where_clause = ''
    if !search.to_s.empty?
      where('name LIKE "%' + search + '%"')
        .where('sizeId = ' + size)
        .page(page)
    else
      all.where('sizeId = ' + size)
         .page(page)
    end
  end
end

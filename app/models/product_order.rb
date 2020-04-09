class ProductOrder < ApplicationRecord
  belongs_to :piece
  belongs_to :order
end

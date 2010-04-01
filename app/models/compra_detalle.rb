class CompraDetalle < ActiveRecord::Base
  # Pertenece a compra "relacion"
  belongs_to :compra
  # Pertenece a producto "relacion"
  belongs_to :producto
end
